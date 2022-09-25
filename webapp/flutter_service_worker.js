'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "b5ac58bfd739f65fc18c1f6a95e29157",
"index.html": "e40d21355c0d4ced297bfd3fb597fcba",
"/": "e40d21355c0d4ced297bfd3fb597fcba",
"main.dart.js": "da75f87e9ed4d8888cd548072f7ecfc7",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "46b4f28883333c6ee5fe5accfeb62fec",
"assets/AssetManifest.json": "e15de24bbe19625b22492c4f9eac92c1",
"assets/NOTICES": "33aaf0965de66b24c1b5ba857224ac25",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "a9234bb510afa33860550350f99e9a60",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/TG.png": "12c0c2adeb08d1b9ead2e7dffad24df7",
"assets/assets/images/ME.png": "61cfaa932183b5f5919fa1b8fd955980",
"assets/assets/images/LA.png": "e91171bf7f9573355d72b4cf1532d92a",
"assets/assets/images/MR.png": "cbaf18e23b570294a2f97b2646f86da9",
"assets/assets/images/NI.png": "ddaff41d1c169600cef562b9b3a5b60a",
"assets/assets/images/LV.png": "082d7d1ee2e4eb6397f68e07d604d466",
"assets/assets/images/OM.png": "1d748dd127029228519001b42b210692",
"assets/assets/images/AF.png": "61e5c4e5a0841b84f2a5f5c26d3feff7",
"assets/assets/images/CY.png": "7d15db19e607caca7a0bfd485aad8dc7",
"assets/assets/images/BJ.png": "d36e7f9f01f57e734324199d5e0d5852",
"assets/assets/images/AQ.png": "9f26c12661d86a2fe54a67751ec79a65",
"assets/assets/images/CN.png": "9ad1a22342d2e4e343f45de7a2425441",
"assets/assets/images/CO.png": "7da45cbd0eed5d471ed1119821ba6cbb",
"assets/assets/images/CX.png": "c92b88f09813468485014cff5666f916",
"assets/assets/images/AG.png": "b43d479fbadb12852c3397f68e6bd6d0",
"assets/assets/images/MS.png": "42888c474640676b7fb8eb8e60792198",
"assets/assets/images/MD.png": "22f3974cdf2a78359838cc75b7a5b91e",
"assets/assets/images/ZM.png": "a7383a00ce002db5a3b618b560ffa4d7",
"assets/assets/images/VN.png": "4f97b752af1aa0b34e5469a8159590da",
"assets/assets/images/TF.png": "512b70cf62d53858562204adbf4ea5ac",
"assets/assets/images/TD.png": "9c2178f4ec3b561b7f8fdb09ce56e9b4",
"assets/assets/images/YT.png": "77e7c1e5eaf06a1d7d645e39e3f5de8b",
"assets/assets/images/LB.png": "1345ce5bd191955fc4181e47b19763ee",
"assets/assets/images/MF.png": "77e7c1e5eaf06a1d7d645e39e3f5de8b",
"assets/assets/images/LU.png": "c33a1d63f1ef3a09fb16183d3d69d55a",
"assets/assets/images/MQ.png": "48e494b92a8325d414bc519ff3642ba7",
"assets/assets/images/CZ.png": "9a4d987b1a984b95b68f3f0f9224e096",
"assets/assets/images/AE.png": "84bf33921e64ca8dbf8f5736f2781ff5",
"assets/assets/images/CM.png": "f8560f1304cb5f0f6f8276fe428b3fa4",
"assets/assets/images/BI.png": "1903f3b5c26c9982e0752d93b1d8e569",
"assets/assets/images/AR.png": "fabb9ed0fff646f713b8b4c23d6d2bbe",
"assets/assets/images/AS.png": "e98f422233301e5f1f140a3e9b1b5eb8",
"assets/assets/images/BH.png": "ad80af133f84048a1a9dde3858143a90",
"assets/assets/images/CL.png": "0c1d90ed5f20ad2fc21fdb73eb0dc829",
"assets/assets/images/AD.png": "0934740359071c0bf2dbe32d62ab59c3",
"assets/assets/images/MP.png": "1404b5695fe42aa8c64217bc6e387e05",
"assets/assets/images/LT.png": "c8059f088a50535954ec7d88eaf96e86",
"assets/assets/images/MG.png": "92ae93cbc2e32353416366a17999f594",
"assets/assets/images/LC.png": "7fddc08a5902d5ac2b4baa6387147c3b",
"assets/assets/images/TR.png": "f3f361292eb657c14e4bb88ef512718e",
"assets/assets/images/UA.png": "7fc8335b97498d2bf894bee40f5699aa",
"assets/assets/images/TV.png": "7edfa38f938de1705ea9c3ef41d7acc4",
"assets/assets/images/VI.png": "31e760df1ee00ef4c2b5fbf2c6bc8139",
"assets/assets/images/MT.png": "68943604d7c68f47537234ce68fb45f9",
"assets/assets/images/NO.png": "d19190167c0fc981944997909697ec22",
"assets/assets/images/MC.png": "83002f75d5be1e3f9cd1ddf303b81b22",
"assets/assets/images/CH.png": "1c9e4274704c803197e814c4f5e96b2b",
"assets/assets/images/BL.png": "77e7c1e5eaf06a1d7d645e39e3f5de8b",
"assets/assets/images/AW.png": "271eeb2199fe961345428395c4ddb6d9",
"assets/assets/images/BZ.png": "2280a2d463188ea3ef76eb4a8924b863",
"assets/assets/images/BM.png": "d4fef18ff5ade34424f4ed07cf2ad1e8",
"assets/assets/images/CI.png": "fd5849564bc0ff0397b92c2a62e08bae",
"assets/assets/images/MU.png": "ecae23b7165856e1f6d3ccaab5852cf1",
"assets/assets/images/US.png": "bdd5bc66a1c8d7073a828e748419c067",
"assets/assets/images/TW.png": "6e35d700f512f581d47cb0ee826534dd",
"assets/assets/images/YE.png": "93bc0f064f565d92ce9b9af21e4b8d3f",
"assets/assets/images/MW.png": "28d0cc038a8859c793d6e414cef77c6e",
"assets/assets/images/NL.png": "736578f6aa239451de9bd71347c8897e",
"assets/assets/images/LS.png": "912d87f6a4ae0ab70b1b38d9d73b7319",
"assets/assets/images/BO.png": "2ba421b109d638394fabd4fe68433e4f",
"assets/assets/images/AT.png": "4445d4a7ee61a1cc0411a6b432ae7059",
"assets/assets/images/CK.png": "ba888674d6b11436c025e41060e158f0",
"assets/assets/images/BY.png": "49e98075d293559d99618abddb7e3d15",
"assets/assets/images/AU.png": "5410b58eeb9553c8528b8ba254ed7d84",
"assets/assets/images/BN.png": "ac96274f464bad6065d07432beff59d1",
"assets/assets/images/MA.png": "4aed010e05ad5709c745f2b8574e3884",
"assets/assets/images/NZ.png": "79a3e35df5a3dec493e3564d054f6e8b",
"assets/assets/images/LR.png": "61792f2a92e964c2cce40521e2baeebb",
"assets/assets/images/MV.png": "74e611f8d59c3158fd7f0b39becea50e",
"assets/assets/images/TC.png": "0a297d81dadfb938cf1d255210deda0c",
"assets/assets/images/UG.png": "cc21dc5ee8d017be4a8cd1bb876a86ce",
"assets/assets/images/TT.png": "5d606ef65058a5c6c0b84f9c4041706c",
"assets/assets/images/PL.png": "44e88eb2e9b51b4b907eb27616ad8eb3",
"assets/assets/images/RS.png": "1692531819eed98c9f59ec0b1b3b1036",
"assets/assets/images/IN.png": "242214975e91e69aad98559376a24be1",
"assets/assets/images/GE.png": "e42123d6fa494d2013f45b7b78c8ae79",
"assets/assets/images/GR.png": "f4f51e1b7c1023e4479b56f661b1431c",
"assets/assets/images/GS.png": "9fa6480421c299965136e8f46a1e43ec",
"assets/assets/images/GD.png": "816bd4b0d1325db8d9bc4e4bdccd1b16",
"assets/assets/images/IO.png": "3bae4a788711ddfead47c3e886df4db8",
"assets/assets/images/HK.png": "fba7e9fd8212ce72ee8a540468f42214",
"assets/assets/images/KP.png": "6ae023ad9b011708d2aef97c47a71fbe",
"assets/assets/images/KG.png": "6047a9beed8801b6d1a7f227f9d6d19b",
"assets/assets/images/PM.png": "0084db7df6ab2d70866911b2b284f3ba",
"assets/assets/images/SV.png": "39162a60b370c386615388661df953e0",
"assets/assets/images/RE.png": "77e7c1e5eaf06a1d7d645e39e3f5de8b",
"assets/assets/images/SA.png": "4710487bd6eea9919c764b79616aec6d",
"assets/assets/images/SC.png": "cdf2ede554aaeb97b4cd7381c40daa3b",
"assets/assets/images/ST.png": "64e2282d51be30713cc7287bb332c77f",
"assets/assets/images/KE.png": "71cab57c208281b84bc5db91d5f242e7",
"assets/assets/images/IM.png": "2de080915801754a2054210da5a770f3",
"assets/assets/images/KR.png": "45dc7cd6f31eb27fd33e8a38e2bd5fec",
"assets/assets/images/GF.png": "3fa2d25dce543bd0541ec70d8b9e3770",
"assets/assets/images/DJ.png": "ab42b86fef26e852df395c98201dd96d",
"assets/assets/images/GQ.png": "097a6113bf20872d6bbf681c7c5003b0",
"assets/assets/images/GP.png": "82d23a71b9c8a39e0c9039861224d79e",
"assets/assets/images/DK.png": "7000b38ccc388a740a5874e64f26f063",
"assets/assets/images/GG.png": "fb5e76936e7fe5c09db7a099e626289d",
"assets/assets/images/IL.png": "9e73aa59981677a7cde85337a0531537",
"assets/assets/images/PN.png": "c763da0771a5495dc757a923fbcf90eb",
"assets/assets/images/SB.png": "05e31fab1bbc2223f27fb2a10062731d",
"assets/assets/images/PY.png": "79914c6cbb04a1297bf6813d0fd491f1",
"assets/assets/images/RU.png": "ebb138214aae14802b88eff6c92a35d8",
"assets/assets/images/KW.png": "2c8178ffaebb059b206f0002d9103436",
"assets/assets/images/DO.png": "96e453ef53020a9fc205356ea5def5c5",
"assets/assets/images/GT.png": "6d5a1aae3dbe3eee3314e7eef340e4cf",
"assets/assets/images/GB.png": "acc6d569017e34981d275c03520e03aa",
"assets/assets/images/GU.png": "3101a2cba2fa4dc679529fcb74e94660",
"assets/assets/images/JE.png": "399d3bbc18f8088d005a5f81051f68c8",
"assets/assets/images/HM.png": "5410b58eeb9553c8528b8ba254ed7d84",
"assets/assets/images/SG.png": "a9d6e459367c0b06d0976ca6e8d0042b",
"assets/assets/images/PK.png": "4566d633af11e2bf2c9eb5d8f14cac79",
"assets/assets/images/SR.png": "717c0c9f9f7dece15e1d7f68c654263a",
"assets/assets/images/SE.png": "dc097cad277e6cfdcc2149b16dc16b42",
"assets/assets/images/JP.png": "09773bc4a6580d1b38c2243fe70d8508",
"assets/assets/images/GW.png": "00a0e47d7b2ca2e27cb0b2bc932e14d8",
"assets/assets/images/EH.png": "33143e00c1a82f6bb57bf7a447c6f50f",
"assets/assets/images/DZ.png": "eae1b1d0c6e01e0915bfd2210016b271",
"assets/assets/images/GA.png": "624acb87f638ab66c00ca12ddf3e293a",
"assets/assets/images/FR.png": "77e7c1e5eaf06a1d7d645e39e3f5de8b",
"assets/assets/images/DM.png": "bee64c6e4299c94386205c00586292f4",
"assets/assets/images/HN.png": "70a210de4df9d75238405026b91fd806",
"assets/assets/images/SD.png": "3af31f63ef1200ebfcef223a3ac218a1",
"assets/assets/images/RW.png": "047137ed024855b3b755761f9288d728",
"assets/assets/images/PH.png": "8e1049514b252113e0feeaf63e523804",
"assets/assets/images/SS.png": "55e03ff4853a11fb48513988856309b6",
"assets/assets/images/QA.png": "ea4e3f85dc7a8f2029ebcd1b67caedc4",
"assets/assets/images/PE.png": "784f4117929839b34087852ba14bcf0b",
"assets/assets/images/PR.png": "96d4d653897bebc5ddd303c3af57a313",
"assets/assets/images/SI.png": "33ae2b327ce19703757fdd4c4aee360b",
"assets/assets/images/HT.png": "f28254185df7fdd1e109b346b0fc3140",
"assets/assets/images/ES.png": "3bbc6d91f27e126eca1dea83cecb848b",
"assets/assets/images/GL.png": "3aaf35b1e3e454e25f171274706adecc",
"assets/assets/images/GM.png": "6e8eb2b6636cca9bddf818b1afb658a7",
"assets/assets/images/ER.png": "2bb2a6df2536cb670501bb2c88381029",
"assets/assets/images/FI.png": "0fe3635a5896e99e8eec6fd1088b3a57",
"assets/assets/images/EE.png": "0be84afc6d5f7ca9380806c568e7c31f",
"assets/assets/images/KN.png": "bba2fc691e0572d49637411b866c23ab",
"assets/assets/images/HU.png": "52b2c632d0d17d5d21a8299d0061da62",
"assets/assets/images/IQ.png": "ee2eafc421bc512864f29dfaaaa813d1",
"assets/assets/images/KY.png": "e1ebe1a6d7ee9a7ae0f71dd7e7c5e140",
"assets/assets/images/SH.png": "acc6d569017e34981d275c03520e03aa",
"assets/assets/images/PS.png": "c08089cfa761f42c389eac7e607d9ce6",
"assets/assets/images/PF.png": "a6e7f8bf865a71ac9ce6b09cb24fc6db",
"assets/assets/images/SJ.png": "d19190167c0fc981944997909697ec22",
"assets/assets/images/ID.png": "a3e4941f90baed38b3c37d76e7e1f4f3",
"assets/assets/images/IS.png": "44227e12d1022a38c8b2d39024da8257",
"assets/assets/images/EG.png": "d6591536486ecfd0e52d6d5a6b7af948",
"assets/assets/images/FK.png": "bcd26e27ae023ed8b20c373aa211dbdf",
"assets/assets/images/FJ.png": "4225226672100fcb80df8b71e4335f62",
"assets/assets/images/GN.png": "7b4785a357ccf77698da5a4fe78abcef",
"assets/assets/images/GY.png": "99c236705c1ad5d5b2d53235a16e3489",
"assets/assets/images/IR.png": "16cfb1c22e1ccae43b9b477beb0de594",
"assets/assets/images/KM.png": "2c2ba84a72dc47b7da3db303f0cab86f",
"assets/assets/images/IE.png": "23e7cb4a0c4a85c11fa6548eddf0cb59",
"assets/assets/images/KZ.png": "ec07eda4425ab4bb1d792107f4696b77",
"assets/assets/images/RO.png": "909e63135a4b1604fbc5d8e40fef1090",
"assets/assets/images/SK.png": "0072f7356b34f242a26dd57fc37cb47a",
"assets/assets/images/PG.png": "d1a12e6504257b92599f3a0bc40c2dfd",
"assets/assets/images/PT.png": "9bc2b7a7a37353994c7926eb15509548",
"assets/assets/images/SO.png": "dd7fb39904768b775d9986bfd1fb559b",
"assets/assets/images/SX.png": "acdb63d7812b2ca9d8c26effa6b7fe20",
"assets/assets/images/HR.png": "c09fe3c04cce9ba7447cb9e9157aeddf",
"assets/assets/images/KI.png": "cec2f57b6b5809efa9b728eefaceee78",
"assets/assets/images/JM.png": "d54e603ec486bb499564d5f285707d85",
"assets/assets/images/EC.png": "97d8164182e028a73a945b32df149be4",
"assets/assets/images/ET.png": "e8749f6cce4c7e380c4cf4018ef5ff43",
"assets/assets/images/FO.png": "774ea7446c4028e6eeffb6dcd4dfad1a",
"assets/assets/images/KH.png": "fd89b1698e2775703eb9702b1113a736",
"assets/assets/images/SY.png": "0ce9ea6a4b15a4d4884b03d5b8330e3f",
"assets/assets/images/SN.png": "c208b3e9a69893717a824a60d3813666",
"assets/assets/images/PW.png": "3f73a90c8b2e5f1cada02983e5de67be",
"assets/assets/images/SL.png": "35948f131b66973dc231f65f910e437e",
"assets/assets/images/FM.png": "81286d7ee7226152aa866afe7e433ab7",
"assets/assets/images/GI.png": "503719cfda1e0d3506ad2ebd1c282018",
"assets/assets/images/DE.png": "1c335a1907025f79c3b54f513de4f02c",
"assets/assets/images/GH.png": "ffb84ee4a7b678ca047c94e7fe5c2b81",
"assets/assets/images/JO.png": "394c09742ca078ac5d66e571f881ed78",
"assets/assets/images/IT.png": "771ed4d835927734bb94d6c75f48c3aa",
"assets/assets/images/PA.png": "8c4af3007a8605829418e378170c9cfa",
"assets/assets/images/SZ.png": "ecd621010889ab71d03fff38bdb94e50",
"assets/assets/images/SM.png": "5050271664cb02d2cd668186b3255b45",
"assets/assets/images/TN.png": "dc0c5bdc974e934446d8e7052ff3d2e4",
"assets/assets/images/ML.png": "3c0a2da4315ab674986d352cbb0ca314",
"assets/assets/images/CG.png": "c94f6b1b2b6c184852a5d7f2cd1b3945",
"assets/assets/images/AX.png": "ab3ce9809e74492b0f6e74ba97a45f70",
"assets/assets/images/AO.png": "9ea9675910b02d9f3eb18b5c358ff7ee",
"assets/assets/images/BT.png": "aaab97e83d9dd2daf9f9d5f79a202592",
"assets/assets/images/BB.png": "c6f79170be352848bdcb7f5b2b667ce9",
"assets/assets/images/CF.png": "971e907e7afdb9a8e9a19859cdc8a2b2",
"assets/assets/images/MM.png": "df77db257e3f9e6223427cc7f2880558",
"assets/assets/images/LI.png": "ca0196e8de372d781afa6cd1323a8c6c",
"assets/assets/images/NA.png": "33dd09e991df6fde258a31c52906a78b",
"assets/assets/images/MZ.png": "8f8f586b88524a49b5ece0087e5fdfef",
"assets/assets/images/TO.png": "cfe698187f14d8b8159bde492f51e903",
"assets/assets/images/VG.png": "339f67f038d7c6328084ff06c26d8277",
"assets/assets/images/VE.png": "f938cd7c47b50fcd1b79fee2c60f04d2",
"assets/assets/images/TZ.png": "10023f80756f31bc8d13bbed215e091c",
"assets/assets/images/TM.png": "5b744c18ef43901c566c8220407ed9c8",
"assets/assets/images/MX.png": "4325fd3bea86ec185e82078302861a56",
"assets/assets/images/NC.png": "f225e0bec9b97af6f5b20ee43069877e",
"assets/assets/images/MO.png": "2f7ecb82426efbd7dbfe540ada270a61",
"assets/assets/images/LK.png": "c1b00284ad29520172f8017f72e0ea5a",
"assets/assets/images/CD.png": "e1b1daa49739957b0da6d2393614426b",
"assets/assets/images/AL.png": "528f3314c449522e147d78d97500c478",
"assets/assets/images/BW.png": "1988a7fd27707b3acebbadb8a0907307",
"assets/assets/images/CR.png": "61d5af15f4be114a8a913d69c23ed6b1",
"assets/assets/images/BV.png": "d19190167c0fc981944997909697ec22",
"assets/assets/images/AM.png": "2aa59afe1046a0ee6f548bc84d6b9066",
"assets/assets/images/AZ.png": "678e0ed0a4088ccca70110a3d8135e82",
"assets/assets/images/BA.png": "743a5e255b17ca66278d4cb39c7b4970",
"assets/assets/images/MN.png": "555db54442062e2e6648dba331810984",
"assets/assets/images/NU.png": "76e167eda05ea52549a7a840634b1bb0",
"assets/assets/images/MY.png": "434b37e85ab7d0ee5fc33d160e008d3e",
"assets/assets/images/TL.png": "a432429366caea29018b241271b3fa28",
"assets/assets/images/WS.png": "ebddeb04b1c27e2f9f75b8e785729d41",
"assets/assets/images/TH.png": "a6b1b22608c910f8dd21200d6b335b46",
"assets/assets/images/XK.png": "471e2429ac6cfe8886b482b627d3db81",
"assets/assets/images/NF.png": "2e53313e357b601d4af8315ddb2498d3",
"assets/assets/images/LY.png": "862c834bfae11061dcf9b49571d7e547",
"assets/assets/images/AI.png": "0454b5c6c83ade578fcee3fca47d0ce9",
"assets/assets/images/BR.png": "7cf5465e794febdc683c4aaea78d0c5f",
"assets/assets/images/CV.png": "559fcbd4329f166d0cf3b3a2f46e9f93",
"assets/assets/images/BE.png": "ddde0afedffce34df7f7af25784679fe",
"assets/assets/images/CA.png": "ffc0416a2ee37950f8db3b45e6e62ba8",
"assets/assets/images/BD.png": "e69fae6ff1d2735b5bb9cc301ae6f9d5",
"assets/assets/images/CW.png": "3ccf16ba7858238f270415d8f3c77944",
"assets/assets/images/BS.png": "28a61381dc077ebf34883feffb853133",
"assets/assets/images/NG.png": "8133faf9ac78b32c4e21658d64fe0b31",
"assets/assets/images/MK.png": "ebb58ed2e661d1f546b810c0c22cacf9",
"assets/assets/images/NP.png": "0082faac55de5cfbd0096d1a710a2d5c",
"assets/assets/images/VA.png": "dad6c57d6fafaa2565903ce5302c6248",
"assets/assets/images/UZ.png": "0fa861d5e9bd3db900a729ca2f935e02",
"assets/assets/images/UM.png": "bdd5bc66a1c8d7073a828e748419c067",
"assets/assets/images/TK.png": "41179aea3dd2819322dcd3cdeff533e8",
"assets/assets/images/VC.png": "286403c07ab00cbb5d8b0ddd97bdce7e",
"assets/assets/images/ZW.png": "b93fc02911402c39ca2349a28c3456ca",
"assets/assets/images/NR.png": "a17a0267f10e0f1eed60f5f36d32e438",
"assets/assets/images/NE.png": "6bde70ebef7467e066437c89b70d516e",
"assets/assets/images/CU.png": "9c4146c5b782518224ef4b9e05efab2a",
"assets/assets/images/BQ.png": "736578f6aa239451de9bd71347c8897e",
"assets/assets/images/BF.png": "8503dfc9be72c0253113dbf28af51805",
"assets/assets/images/BG.png": "9194ff9e38836ae9b3da3165aea0335c",
"assets/assets/images/CC.png": "0255cf3cd299d9a00dd4e3d2268e4dbc",
"assets/assets/images/MH.png": "69cb1dedd8b427c4e0591806ff8b567a",
"assets/assets/images/ZA.png": "c610c2c5ed23e0bcbc546ccfbd0bd6c1",
"assets/assets/images/UY.png": "3053038685a2eb46872d4a5df26b1357",
"assets/assets/images/WF.png": "7df9740e5be902df07c5ec4a26eed939",
"assets/assets/images/VU.png": "d0457389480f42cd52494028488979d0",
"assets/assets/images/TJ.png": "9cb7f3f6b82dd08f82248cb38d295d5e",
"assets/assets/Countries.json": "52b4b5083a237c999af2c25c0fd572e2",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
