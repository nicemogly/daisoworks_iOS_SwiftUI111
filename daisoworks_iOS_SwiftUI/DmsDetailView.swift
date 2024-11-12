//
//  DmsDetailView.swift
//  daisoworks_iOS_SwiftUI
//
//  Created by AD2201016P02 on 10/21/24.
//
import SwiftUI
import UIKit




struct DmsView2: Decodable {

    var reqId: String
    let productCd: String?
    let korProductDesc: String?
    let reqDate: String?
    let dsnTypNm: String?
    let buyCompNm: String?
    let reqTypNm: String?
    let reqEmpNm: String?
    let cmplExptDate: String?
    let phEmpNm: String?
    let productImageType: String?
    let productImage: String?
    let apprSeq: String?
    let revNo: String?
    
   
}



struct DmsView3: Decodable {
    let fromEmpNm: String?
    let toEmpNm: String?
    let registDate: String?
    let cmnt: String?
}

struct DmsView4: Decodable {
    let origFileNm  : String?
    let origFileExt  : String?
    let srvrPath  : String?
}

struct DmsView5: Decodable  , Identifiable{
    let id = UUID()
    let apprTypNm: String?
    let apprEmpNm: String?
    let apprDate: String?
    let apprCfmFgNm: String?
    let myTurn: String?
    var apprCmmt: String?
    let apprUserId: String?
    let reqId: String?
    let revNo: String?
    let apprSeq: String?
    let apprTyp: String?
}

struct DmsView6: Decodable {
    var methodNm: String?
    var resultCode: String?
    var resultMessage: String?
}

struct DmsDetailView: View  {
    @Environment(\.presentationMode) private var presentaionMode: Binding<PresentationMode>
 
    @State private var apprSeq = ""
    @State private var revNo = ""
    
    @State private var apprTyp = ""

    @State private var appr_1: String = "없슴"
    @State private var appr_2: String = ""
    @State private var appr_3: String = ""
    @State private var appr_33: String = ""
    @State private var appr_4: String = ""
    @State private var appr_5: String = ""
    @State private var apprCfmg: String = ""
    @State private var apprCmmt: String = ""
    
    
    @State private var appr_reqId: String = ""

    
    @Binding var attr1: String
    @Binding var attr2: String
    @Binding var attr3: String
    
    @State var dmsview2 = [DmsView2]()
    @State var dmsview3 = [DmsView3]()
    @State var dmsview4 = [DmsView4]()
    @State var dmsview5 = [DmsView5]()
    @State var dmsview6 = [DmsView6]()
    
    @State var imgt1: String = ""
    
    @State private var resultText: String = ""
    @State var resultflag = false
    @State private var isLoading = false
    @State private var v_attr0 = ""
    @State private var v_attr3 = ""
    @State private var v_attr4 = ""
    @State private var v_attr5 = ""
    @State private var v_attr6 = ""
    @State private var v_attr7 = ""
    @State private var currentScale: CGFloat = 1.0
    @GestureState private var zoomFactor: CGFloat = 1.0
    
    @State private var selection  = "선택"
    
      var data9 = ["1031154","1031154","1031155"]
    
    @State private var isShowingSheet = false
    @State var isShowing = false
    @State var isShowing1 = false
    
    var magnification: some Gesture {
        return SwiftUI.MagnificationGesture()
            .updating($zoomFactor){(value, scale , transaction ) in
                scale = value
            }.onEnded { (value) in
                currentScale *= value
            }
    }
    
    var body: some View {
        
        
        //let Userid = UserDefaults.standard.string(forKey: "Userid")
        let Userid:String = "AH2201001" //정은빈
        
       // let Userid:String = "AH0403070" //이유용
        
        NavigationView {
            VStack{
       
            
                HStack {
                    Text("디자인진행 승인정보 상세")
                        .font(.system(size:18 , weight: .bold))
                    Spacer()
                    Spacer()
                    
                }.padding(5)
         
            ScrollView {
              
                
                    ForEach(dmsview2, id: \.reqId) { item2 in
                         
                        VStack{
                           
                           // Image(systemName: "magnifyingglass.circle.fill" )
                            AsyncImage(url: URL(string: "http://59.10.47.222:3000/static/\(item2.productCd!).jpg")) { image in
                                image.resizable()
                                 
                            }placeholder: {
                               // ProgressView()
                                Image("noimage200")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:100 , height:100)
                                
                            }.frame(width:200 , height:200)
                                
                         
                                .scaledToFit()
                                .frame(width: 80, height:  80)
                                .padding(.bottom , 60   )
                            Text("\(item2.productCd == nil ? " " : item2.productCd!)")
                            Text("\(item2.korProductDesc == nil ? " " : item2.korProductDesc!)")
                        }.frame(maxWidth: .infinity , minHeight: 200)
                        
                        VStack {
                            
                        }.frame(maxWidth: .infinity , minHeight:3)
                            .background(Color.gray)
                            .padding(.bottom , 10)
                       
                     
                        
                        
                        VStack(alignment: .leading ){
                            Text("의뢰번호 : \(item2.reqId)").padding(.bottom , 10)
                            Text("의뢰일자 : \(item2.reqDate == nil ? " " : item2.reqDate! )").padding(.bottom , 10)
                            Text("의뢰유형 : \(item2.dsnTypNm == nil ? " " : item2.dsnTypNm! )").padding(.bottom , 10)
                            Text("바이어회사 : \(item2.buyCompNm == nil ? " " : item2.buyCompNm! )").padding(.bottom , 20)
                            Text("의뢰구분 : \(item2.reqTypNm == nil ? " " : item2.reqTypNm! )").padding(.bottom , 20)
                            Text("의뢰자 : \(item2.reqEmpNm == nil ? " " : item2.reqEmpNm! )").padding(.bottom , 20)
                            Text("컨펌목표일 : \(item2.cmplExptDate == nil ? " " : item2.cmplExptDate! )").padding(.bottom , 20)
                            Text("촬영자 : \(item2.phEmpNm == nil ? " " : item2.phEmpNm! )").padding(.bottom , 20)
//                            Text("이미지 : \(item2.productImage == nil ? " " : item2.productImage! )").padding(.bottom , 20)
//                           
                        }
                        
                        .frame(
                                minWidth: 0 ,
                                maxWidth: .infinity ,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                    }
                        
                        VStack {
                            
                        }.frame(maxWidth: .infinity , minHeight:3)
                            .background(Color.gray)
                      
                       VStack {
                           Text("Comment")
                               .padding(.bottom , 20)
                               .padding(.top , 0)
                               .font(.headline)
                               .fontWeight(.bold)
                               .underline()
                       }.frame(maxWidth: .infinity ,  alignment: .leading)
                     
                
                ForEach(dmsview3, id: \.registDate) { item3 in
                            
                            VStack(alignment: .leading ){
                             
                                
                                Text("작성자 : \(item3.fromEmpNm!)").padding(.bottom , 10)
                                Text("수신자 : \(item3.toEmpNm!)").padding(.bottom , 10)
                                Text("작성일 : \(item3.registDate!)").padding(.bottom , 10)
                                Text("\(item3.cmnt!.removeHTMLTag().replacingOccurrences(of: "&nbsp;", with: ""))").padding(.bottom , 10)
                                
//
//                                HTMLText(html: "\(item3.cmnt!)")
//                                    .font(.system(size:16 , weight: .bold))
//                                    .foregroundStyle(.gray)
//                                    .frame(maxWidth: .infinity , alignment: .leading)
                                Spacer()
                                
                                Divider()
                                
                                
                            }
                            
                            .frame(
                                minWidth: 0 ,
                                maxWidth: .infinity ,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                            
                        }//end foreach comment
                        
                        VStack {
                            
                        }.frame(maxWidth: .infinity , minHeight:3)
                            .background(Color.gray)
                        
                        
                    
                    VStack {
                        HStack {
                        
                        Text("디자인 정보")
                            .padding(.bottom , 20)
                            .padding(.top , 0)
                            .font(.headline)
                            .fontWeight(.bold)
                            .underline()
                         
                        Spacer()
                            
                            
                           
                            
                            
                        }
                    }.frame(maxWidth: .infinity ,  alignment: .leading)
              
               
                
               
                  // 디자인정보
                ForEach(data9, id: \.self) { item4 in
                  
                 
                   
                   
                    VStack(alignment: .leading ){
                        
                        ScrollView(.horizontal){
                           
                            let url = URL(string: "http://59.10.47.222:3000/static/\(item4).jpg")
                                
                            AsyncImage(url: url) { image in
                                
                                
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(currentScale * zoomFactor)
                                    .gesture(magnification)
                            } placeholder: {
                                    
                                    Image("noimage200")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .scaleEffect(currentScale * zoomFactor)
                                        .gesture(magnification)
                                    //   .frame(width: .infinity , height: 300 , alignment: .center)
                                
                              }.frame(width: UIScreen.main.bounds.width , height:300 , alignment: .center)
                                .scaledToFit()
                                .padding(.bottom , 30   )
                                
                            
                        }
                           
                            Spacer()
                            Divider()
                            
                            .frame(
                                minWidth: 0 ,
                                maxWidth: .infinity ,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                    }
                            
                        }//end foreach design info
                        
                        VStack {
                            
                        }.frame(maxWidth: .infinity , minHeight:3)
                            .background(Color.gray)
                        
                
                VStack {
                    HStack {
                        Text("결재 정보")
                            .padding(.bottom , 20)
                            .padding(.top , 0)
                            .font(.headline)
                            .fontWeight(.bold)
                            .underline()
                        Text("\(appr_1)").foregroundStyle(.white).hidden()
                    }
                    
                }.frame(maxWidth: .infinity ,  alignment: .leading)
              
                     VStack(alignment: .leading ){
                      
                         ForEach(dmsview5, id: \.id) { item3 in
                             
                      
                                 HStack {
                                     Text("\(item3.apprTypNm == nil ? " " : item3.apprTypNm!)").frame(width:60 , alignment: .leading)
                                     
                                     Text("\(item3.apprEmpNm == nil ? " " : item3.apprEmpNm!)").frame(width:60 , alignment: .leading)
                                
                                     Text("\(item3.apprDate == nil ? " " : item3.apprDate!)").frame(width:165 , alignment: .leading)
                                     
                                    
                                     Button(action: {
                                         if (item3.apprEmpNm == "대상아님") {
                                            
                                         }else {
                                             
                                             appr_1 = item3.apprTypNm!
                                             appr_2 = item3.apprEmpNm!
                                             appr_3 = item3.apprCmmt == nil ? " " : item3.apprCmmt!
                                             appr_4 = item3.myTurn!
                                             appr_5 = item3.apprUserId!
                                           
                                             apprTyp = item3.apprTyp!
                                             apprCmmt = appr_3
                                             isShowingSheet.toggle()
                                         }
                                             
                                     } , label: {
                                     
                                         if (item3.apprEmpNm == "대상아님") {
                                             Text("무결")
                                                 .padding(5)
                                                 .background(Color.gray)
                                                 .foregroundColor(.white)
                                             
                                             
                                         }else{
                                              Text("\(item3.apprCfmFgNm!)")
                                                     .padding(5)
                                                     .background(item3.apprCfmFgNm! == "대기" ? Color.gray : Color.blue)
                                                     .foregroundColor(item3.apprCfmFgNm! == "대기" ? Color.black : Color.white)
                                           
                                         }
                                         
                                     }).padding(.bottom , 8)
                                     
                                        
                                
                                     
                                     //Text("\(item3.apprTypNm == nil ? " " : item3.apprTypNm!)").padding(.bottom , 10)
                                 }
                             Divider()
                           
                         }
                         
           
                         Divider()
                         
                         
                     }
                     
                     .frame(
                         minWidth: 0 ,
                         maxWidth: .infinity ,
                         minHeight: 0,
                         maxHeight: .infinity,
                         alignment: .topLeading
                     )
                     
              
                 
                 VStack {
                     
                 }.frame(maxWidth: .infinity , minHeight:3)
                     .background(Color.gray)
            
                } //ScrollView End
                
              
            }//VStack End
            .onAppear(perform: INIT_1)
            .padding(10)
            
            
            .sheet(isPresented: $isShowingSheet , onDismiss: didDismiss) {
                    VStack {
                        Text("결재 승인 관리").fontWeight(.bold)
                            .frame(  maxWidth: .infinity  , minHeight:50 , alignment: .leading)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .padding(.bottom , 15)
                        HStack {
                            Text("직책 : \(appr_1)")
                            Spacer()
                        } .padding(.bottom , 15)
                        
                        HStack {
                            Text("성명 : \(appr_2)")
                            Spacer()
                        } .padding(.bottom , 15)
                        
                        HStack {
                            TextEditor(text: $apprCmmt)
                                .border(Color.gray)
                                .cornerRadius(3)
                                .frame(height:100 )
                                .foregroundStyle(.secondary)
                            
                           
                        } .padding(.bottom , 15)
                        
                   
                        HStack{
                          
                        if(appr_4 == "true" &&  appr_5 == Userid){
                            Button("승인" , action: {
                               // isShowingSheet.toggle()
                                
                                isShowing = true
                            })
                            .alert("승인 하시겠습니까?" , isPresented: $isShowing) {
                                Button("OK", role: .destructive) {
                                    apprCfmg = "Y"
                                   // apprCmmt = appr_3
                                    
                                    loadData6()
                                   //
                                    isShowingSheet.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        presentaionMode.wrappedValue.dismiss()
                                    }
                                    
                                }
                                Button("Cancel", role: .cancel) {
                                
                                   
                                    print("Cancel")
                                    
                                }
                            }
                            
                            .padding(10)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            
                            Button("반려" , action: {
                               // isShowingSheet.toggle()
                                isShowing1 = true
                            })
                            
                            .alert("반려 하시겠습니까?" , isPresented: $isShowing1) {
                                Button("OK", role: .destructive) {
                                    apprCfmg = "N"
                                   // apprCmmt = appr_3
                                    
                                    loadData6()
                                   //
                                    isShowingSheet.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        presentaionMode.wrappedValue.dismiss()
                                    }
                                    print("OK")
                                    
                                }
                                Button("Cancel", role: .cancel) { print("Cancel")}
                            }
                            .padding(10)
                            .background(Color.gray)
                            .foregroundColor(.white)
                        }
                        
                        Button("확인" , action: {
                            isShowingSheet.toggle()
                        })
                        .padding(10)
                        .background(Color.gray)
                        .foregroundColor(.white)
                            
                        }
                    
                            .presentationDetents([.fraction(0.5) , .medium, .large])
                        Spacer()
                    }.padding(20)
                }
            
        } //NavigationView End

        
        
        // 상단 탭바 백버튼 설정 START
        //=============================================================================
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement:
                        .navigationBarLeading) {
                            Button(action: {
                                presentaionMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "arrowshape.left.circle")
                                    .foregroundColor(.white)
                                Text("Back")
                                    .foregroundColor(.white)
                            })
                        }
            })
        //==============================================================================
        // 상단 탭바 백버튼 설정 END
        
          
    }

    func startLoading() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
        {
                isLoading = false
                resultflag = true
        }
    }
    
    func didDismiss() {
    }
    
    func INIT_1()  {
       
       loadData1()  //req info
       loadData2() //comment
       loadData3() //Design Image
       loadData4() //Design Image
 
           
   
        print("Loading:DmsDetailView_init")
    }
    
    func loadData1(){

        guard let url3 = URL(string: "http://59.10.47.222:3000/dmsview2?apikey=WCE2HG6-CKQ4JPE-J39AY8B-VTJCQ10&reqId=\(attr1)&revNo=\(attr2)") else {
            print("Invalid URL")
            
            return
        }
        //print("\(Userid)")

        let request3 = URLRequest(url: url3)
        URLSession.shared.dataTask(with: request3) { data3, response, error in
            if let data3 = data3 {
                let decoder3 = JSONDecoder()
                
                decoder3.dateDecodingStrategy = .iso8601
                
                if let decodedResponse3 = try? decoder3.decode([DmsView2].self, from: data3){
                    DispatchQueue.main.async {
                       // self.users = decodedResponse
                        self.dmsview2 = decodedResponse3
                        print("\(decodedResponse3)")
                        print("valueT:\(self.dmsview2)")
                        print("detail건수\(self.dmsview2.count)")
                        
                    
                        if(self.dmsview2.count == 0 ){
                            resultflag = false
                            resultText = "검색된 결과가 없습니다."
                        }else{
                            
                            self.dmsview2.forEach {

                                v_attr3 = $0.productImage ?? ""
                                v_attr0 = $0.productImageType ?? ""
                                v_attr4 = $0.productCd ?? ""
                                apprSeq = $0.apprSeq ?? ""
                                revNo = $0.revNo ?? ""
                                appr_reqId = $0.reqId
                            //이미지 가져오기(상단 품번이미지
                                requestGet(v_attr3: v_attr3, v_attr4: v_attr4, v_attr0: v_attr0)
                        
                                
                            }
                        
                            print("OKAY 여기?")
                            resultText = ""
                          
                            startLoading()
                            
                       
                        }
                    }
                    return
                
                }
            }
        }.resume()
    }
    
    
    func requestGet( v_attr3:String , v_attr4:String , v_attr0:String) {
        
      //  let prefixattr3:String  = "https://devdms.asungcorp.com"
      //  let attr33 = prefixattr3+"/file/dso/202106/202106_000232/thumb/202106_000232_011.jpg"
      //        var attr5 = "https://devdms.asungcorp.com/file/dso/202106/202106_000232/thumb/202106_000232_01.jpg"
        //        var attr44 = "/file/dso/202106/202106_000232/thumb/202106_000232_01.jpg"
     
        var prefixattr3 = ""
        var attr5 = ""
        var imgUrl1 = ""
       
         attr5 = v_attr4 + ".jpg"
        
        
        
        if (v_attr0 == "PATH") {
            prefixattr3 = "https://devdms.asungcorp.com"
        }else if(v_attr0 == "BLOB"){
            prefixattr3 = "http://herp.asunghmp.biz/FTP"
        }
        
        imgUrl1 = prefixattr3+v_attr3
     
        guard let url3 = URL(string: "http://59.10.47.222:3000/imgdownload?apikey=WCE2HG6-CKQ4JPE-J39AY8B-VTJCQ10&reqno=\(attr5)&imgUrl=\(imgUrl1)") else {
            print("Invalid URL")
            
            return
        }
        
        var request = URLRequest(url: url3)
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
          
            guard let response = response as? HTTPURLResponse, (200 ..< 305) ~= response.statusCode else {
                 print("Error: HTTP request failed")
                
                return
            }
            
            guard error == nil else {
                print("Error: error")
              
                return
            }
            
            guard data != nil else {
                print("error: did no receive data")
                return
            }
            
      
        
            
          
        }.resume()
        
        
    }
    
    func requestGet1( v_attr5:String , v_attr6:String , v_attr7:String) {
        
        
        print("==============requestGET1==============")
        let attr8 = v_attr5 + "." + v_attr6
    
        // var attr3 = v_attr3
        let prefixattr3:String  = "https://devdms.asungcorp.com"
        let attr9 = prefixattr3 + v_attr7 + attr8
      ////        var attr5 = "https://devdms.asungcorp.com/file/dso/202106/202106_000232/thumb/202106_000232_01.jpg"
        //        var attr44 = "/file/dso/202106/202106_000232/thumb/202106_000232_01.jpg"
       
        print ("attr8: \(attr8)")
        print ("attr9: \(attr9)")
        guard let url3 = URL(string: "http://59.10.47.222:3000/imgdownload?apikey=WCE2HG6-CKQ4JPE-J39AY8B-VTJCQ10&reqno=\(attr8)&imgUrl=\(attr9)") else {
            print("Invalid URL")
            
            return
        }
        
        var request = URLRequest(url: url3)
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, (200 ..< 305) ~= response.statusCode else {
                 print("Error: HTTP request failed")
                
                return
            }
            
            guard error == nil else {
                print("Error: error")
                print(error ?? "")
                return
            }
            
            guard data != nil else {
                print("error: did no receive data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("error: HTTP request failed")
                return
                
            }
            
        
            
          
        }.resume()
        
        
    }
    
    func loadData2(){

        guard let url3 = URL(string: "http://59.10.47.222:3000/dmsview3?apikey=WCE2HG6-CKQ4JPE-J39AY8B-VTJCQ10&reqId=\(attr1)&revNo=\(attr2)") else {
            print("Invalid URL")
            
            return
        }
        //print("\(Userid)")

        let request3 = URLRequest(url: url3)
        URLSession.shared.dataTask(with: request3) { data3, response, error in
            if let data3 = data3 {
                let decoder3 = JSONDecoder()
                
                decoder3.dateDecodingStrategy = .iso8601
                
                if let decodedResponse3 = try? decoder3.decode([DmsView3].self, from: data3){
                    DispatchQueue.main.async {
                       // self.users = decodedResponse
                        self.dmsview3 = decodedResponse3
                        print("\(decodedResponse3)")
                        print("valueT:\(self.dmsview3)")
                        print("detail건수\(self.dmsview3.count)")
                        
                    
                        if(self.dmsview3.count == 0 ){
                            resultflag = false
                            resultText = "검색된 결과가 없습니다."
                        }else{
                            
                         
                        
                            print("OKAY Detail3===,여기2")
                            resultText = ""
                          
                            startLoading()
                            
                       
                        }
                    }
                    return
                
                }
            }
        }.resume()
    }
    
    func onImageChange(targimg: String){
        
        print("\(targimg)")
        AsyncImage(url: URL(string: "http://59.10.47.222:3000/static/\(targimg)")) { image1 in
            image1.resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(currentScale * zoomFactor)
                .gesture(magnification)
        }placeholder: {
           // ProgressView()
            Image("noimage200")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100 , height:100)
            
        }.frame(width:200 , height:200)
        
    }
    
    
    
    func loadData3(){

        
        print("==============requestGET1==============1")
        guard let url3 = URL(string: "http://59.10.47.222:3000/dmsview4?apikey=WCE2HG6-CKQ4JPE-J39AY8B-VTJCQ10&reqId=\(attr1)&revNo=\(attr2)") else {
            print("Invalid URL")
            
            return
        }
        //print("\(Userid)")

        let request3 = URLRequest(url: url3)
        URLSession.shared.dataTask(with: request3) { data3, response, error in
            if let data3 = data3 {
                let decoder3 = JSONDecoder()
                
                decoder3.dateDecodingStrategy = .iso8601
                
                if let decodedResponse3 = try? decoder3.decode([DmsView4].self, from: data3){
                    DispatchQueue.main.async {
                       // self.users = decodedResponse
                        self.dmsview4 = decodedResponse3
                        print("\(decodedResponse3)")
                        print("valueT3:\(self.dmsview4)")
                        print("detail3건수\(self.dmsview4.count)")
                        
                    
                        if(self.dmsview4.count == 0 ){
                            resultflag = false
                            resultText = "검색된 결과가 없습니다."
                        }else{
                            
                            print("==============requestGET1==============2")
                            self.dmsview4.forEach {

                                v_attr5 = $0.origFileNm ?? ""
                                v_attr6 = $0.origFileExt ?? ""
                                v_attr7 = $0.srvrPath ?? ""
                                
                                requestGet1(v_attr5: v_attr5, v_attr6: v_attr6 , v_attr7: v_attr7)
                        
                                
                            }
                            
                            
                           
                        
                            print("OKAY Detail  image===========")
                            resultText = ""
                          
                            startLoading()
                            
                       
                        }
                    }
                    return
                
                }
            }
        }.resume()
    }
    
  
    func loadData4(){
        //let Userid = UserDefaults.standard.string(forKey: "Userid")
        let Userid = "AH2201001"//정은빈
        
       // let Userid:String = "AH0403070" //이유용
        print("OKAY Detail5===,여기51")
        
        guard let url3 = URL(string: "http://59.10.47.222:3000/dmsview5?apikey=WCE2HG6-CKQ4JPE-J39AY8B-VTJCQ10&reqId=\(attr1)&revNo=\(attr2)&apprSeq=\(attr3)&mUserId=\(Userid)") else {
            print("Invalid URL")
            
            return
        }
        //print("\(Userid)")

        let request3 = URLRequest(url: url3)
        URLSession.shared.dataTask(with: request3) { data3, response, error in
            if let data3 = data3 {
                let decoder3 = JSONDecoder()
                
                decoder3.dateDecodingStrategy = .iso8601
                
                if let decodedResponse3 = try? decoder3.decode([DmsView5].self, from: data3){
                    DispatchQueue.main.async {
                       // self.users = decodedResponse
                        self.dmsview5 = decodedResponse3
                        print("\(decodedResponse3)")
                        print("valueT:\(self.dmsview5)")
                        print("detail건수\(self.dmsview5.count)")
                        
                    
                        if(self.dmsview5.count == 0 ){
                            resultflag = false
                            resultText = "검색된 결과가 없습니다."
                        }else{
                            

                            
                            self.dmsview5.forEach {

                              //  apprTyp = $0.apprTyp ?? ""
                                apprCmmt = $0.apprCmmt ?? ""
                                
                            }
                            
                            
                            
                           
                            print("OKAY Detail5===,여기5")
                            resultText = ""
                          
                            startLoading()
                            
                       
                        }
                    }
                    return
                
                }
            }
        }.resume()
    }
   
    func loadData6(){
        //let Userid = UserDefaults.standard.string(forKey: "Userid")
        let Userid = "AH2201001"//정은빈
        
       // let Userid:String = "AH0403070" //이유용

        guard let url6 = URL(string: "http://59.10.47.222:3000/dmspost1?apikey=WCE2HG6-CKQ4JPE-J39AY8B-VTJCQ10&reqId=\(attr1)&revNo=\(attr2)&apprSeq=\(attr3)&apprTyp=\(apprTyp)&apprCfmFg=\(apprCfmg)&apprCmmt=\(apprCmmt)&mUserId=\(Userid)") else {
            print("Invalid URL")
            
            return
        }
        print("\(url6)")

        let request6 = URLRequest(url: url6)
        URLSession.shared.dataTask(with: request6) { data33, response, error in
            if let data33 = data33 {
                let decoder33 = JSONDecoder()
                
                decoder33.dateDecodingStrategy = .iso8601
                
                if let decodedResponse33 = try? decoder33.decode([DmsView6].self, from: data33){
                    DispatchQueue.main.async {
                       // self.users = decodedResponse
                        self.dmsview6 = decodedResponse33
                        print("\(decodedResponse33)")
                        print("valueT:\(self.dmsview6)")
                        print("detail건수\(self.dmsview6.count)")
                        
                    
                       
                            
                           
                            print("OKAY Detail6===,여기5")
                            resultText = ""
                          
                            startLoading()
                            
                       
                    }
                    return
                
                }
            }
        }.resume()
    }
   
    
    
    
}

extension String {
    
    func removeHTMLTag() -> String {

        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)

     }

 }

