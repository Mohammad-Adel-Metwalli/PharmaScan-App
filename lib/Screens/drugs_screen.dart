import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/Helpers/firebase_helper.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/Screens/drug_details_screen.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';
import 'package:pharmascan/widgets/custom_button.dart';
import 'package:pharmascan/widgets/custom_cherry_success_toast.dart';
import 'package:pharmascan/widgets/custom_circular_indicator.dart';
import 'package:pharmascan/widgets/custom_drag_handle.dart';
import 'package:pharmascan/widgets/custom_text_form_field.dart';
import 'package:pharmascan/widgets/drugs_list_item.dart'; 

class DrugsScreen extends StatefulWidget 
{
  const DrugsScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<DrugsScreen> createState() => _DrugsScreenState();
}

class _DrugsScreenState extends State<DrugsScreen> 
{
  DrugModel drugModel = DrugModel(name: '', price: 0, quantity: 0, barCode: '', description: '');
  GlobalKey<FormState> formKey = GlobalKey();
  String searchedDrug = '';
  
  @override
  Widget build(BuildContext context) 
  {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: widget.userModel.isAdmin ? FloatingActionButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: AppStyles.bottomSheetBorderRadius),
              builder: (context) => Container(
                height: 540.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppStyles.bottomSheetBorderRadius,
                ),

                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Form(
                    key: formKey,
                    child: ListView( 
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      children: [
                        SizedBox(height: 10.h),
                      
                        Center(child: CustomDragHandle(height: 10, width: 100)), 
                    
                        SizedBox(height: 20.h),
                    
                        CustomTextFormField(
                          label: 'Name', 
                          suffixIcon: null, 
                          prefixIcon: Image.asset('assets/Group 21.png', scale: (0.8).h), 
                          onChanged: (data) => setState(() => drugModel.name = data),
                        ),
                    
                        SizedBox(height: 10.h),
                    
                        CustomTextFormField(
                          label: 'Price', 
                          suffixIcon: null,
                          keyboardType: TextInputType.number,
                          prefixIcon: Icon(AntDesign.pound_circle_fill, color: AppColors.blue, size: 30.h), 
                          onChanged: (data) => setState(() => drugModel.price = double.parse(data)),
                        ),
                    
                        SizedBox(height: 10.h),
                    
                        CustomTextFormField(
                          label: 'Quantity', 
                          suffixIcon: null, 
                          keyboardType: TextInputType.number,
                          prefixIcon: Icon(CupertinoIcons.number_circle, color: AppColors.blue, size: 30.h), 
                          onChanged: (data) => setState(() => drugModel.quantity = int.parse(data)),
                        ),
                    
                        SizedBox(height: 10.h),
                    
                        FutureBuilder<int>(
                          future: FirebaseHelper.numberOfAvailableDrugs(),
                          builder: (context, snapshot) 
                          { 
                            if(snapshot.connectionState == ConnectionState.waiting) 
                            {
                              return CustomCircularIndicator();
                            }
                            
                    
                            else
                            {
                              int drugID = snapshot.data!.toInt() + 1; 
                            drugModel.barCode = 'Drug-$drugID';
                            return CustomTextFormField(
                              label: 'ID', 
                              readOnly: true, 
                              suffixIcon: null,
                              initialValue: 'Drug-$drugID',
                              prefixIcon: Icon(Iconsax.hospital_bold, color: AppColors.blue, size: 25.h), 
                            );
                            }
                          }
                        ),
                    
                        SizedBox(height: 10.h),
                    
                        CustomTextFormField( 
                          maxLines: 5,
                          suffixIcon: null,
                          label: 'Description',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 90.h),
                            child: Icon(Iconsax.note_21_bold, color: AppColors.blue, size: 30.h),
                          ), 
                          onChanged: (data) => setState(() => drugModel.description = data),
                        ), 
                        
                        SizedBox(height: 10.h), 
                    
                        CustomButton(
                          onPressed: () async
                          {
                            if(formKey.currentState!.validate()) 
                            {
                              await FirebaseHelper.addDrug(drugModel: drugModel);
                              if(context.mounted)
                              {
                                customCherrySuccessToast(successTitle: 'Success Addition', successMessage: 'Drug Added Successfully!').show(context);
                                Navigator.pop(context);
                              }
                            }
                          },
                          buttonColor: AppColors.blue, 
                          buttonBody: Center(child: Text('Add Drug', style: AppStyles.pharmaScan22Weight700White)),
                        ), 

                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: AppColors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
            child: Icon(CupertinoIcons.add_circled_solid, color: AppColors.white, size: 30.h),
          ) : null,

          backgroundColor: AppColors.white,
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            children: [ 
              SizedBox(height: 20.h),
        
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.blue,
                    child: InkWell(
                      onTap: () => Navigator.pop(context), 
                      child: Icon(Icons.chevron_left_rounded, color: AppColors.white, size: 30.h),
                    ), 
                  ), 
        
                  const Spacer(),
        
                  Image.asset('assets/Group 21.png', scale: (0.8).h), 
        
                  SizedBox(width: 5.w), 
        
                  Text('Available Drugs', style: GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.customBoldGrey)), 
                  
                  const Spacer(flex: 2),
                ],
              ), 
        
              SizedBox(height: 20.h),

              TextFormField( 
                    style: AppStyles.pharmaScan15Weight500Black, 
                    onChanged: (data) => setState(() => searchedDrug = data),
                    decoration: InputDecoration(
                      hintText: 'Search on Drug...',
                      hintStyle: AppStyles.pharmaScan14Weight600CustomBoldGrey70,
                      prefixIcon: Icon(CupertinoIcons.search, color: AppColors.blue, size: 30.h),
                      border: AppStyles.borderStyleOfSearchBar(),
                      enabledBorder: AppStyles.borderStyleOfSearchBar(),
                      focusedBorder: AppStyles.borderStyleOfSearchBar(),
                    ),
                  ), 

              StreamBuilder(
                stream: FirebaseHelper.fetchAllDrugs(),
                builder: (context, snapshot) 
                {
                  if(snapshot.connectionState == ConnectionState.waiting) 
                  {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 250.h),
                      child: CustomCircularIndicator(size: 60),
                    );
                  }


                  else
                  { 
                    List<QueryDocumentSnapshot<Map<String, dynamic>>> drugsCollection = snapshot.data!.docs.toList(); 
                    List<DrugModel> allDrugs = drugsCollection.map((doc) => DrugModel.fromFirestore(doc.data())).toList(); 
                    List<DrugModel> filteredDrugs = searchedDrug.isEmpty ? allDrugs : allDrugs.where((drugItem) { 
                      final drug = drugItem.name.toLowerCase(); 
                      return drug.contains(searchedDrug.toLowerCase());
                    }).toList(); 

                    return ListView.builder( 
                    shrinkWrap: true,
                    itemCount: filteredDrugs.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) 
                    {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: DrugsListItem( 
                          userModel: widget.userModel, 
                          drugModel: filteredDrugs[index],
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DrugDetailsScreen(drugModel: filteredDrugs[index]))),
                        ),
                      );
                    },
                  );
                  }
                }
              ),     
            ],
          ),
        ),
      );
  }
}