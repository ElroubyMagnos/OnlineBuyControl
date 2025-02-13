; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [348 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [690 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 266
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 300
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 308
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 8: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 317
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 63401260, ; 10: ElroubyMauiLibraryPlus.dll => 0x3c76d2c => 343
	i32 65960268, ; 11: Microsoft.Win32.SystemEvents.dll => 0x3ee794c => 214
	i32 66541672, ; 12: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 13: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 341
	i32 68219467, ; 14: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 15: Microsoft.Maui.Graphics.dll => 0x44bb714 => 212
	i32 82292897, ; 16: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 17: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 325
	i32 101534019, ; 18: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 284
	i32 117431740, ; 19: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 20: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 284
	i32 122350210, ; 21: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 22: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 304
	i32 136584136, ; 23: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 340
	i32 140062828, ; 24: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 333
	i32 142721839, ; 25: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 26: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 27: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 28: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 240
	i32 176265551, ; 29: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 286
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 32: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 33: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 238
	i32 220171995, ; 34: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 260
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 39: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 243
	i32 276479776, ; 41: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 262
	i32 280482487, ; 43: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 259
	i32 291076382, ; 44: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 45: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 46: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 338
	i32 318968648, ; 47: Xamarin.AndroidX.Activity.dll => 0x13031348 => 229
	i32 321597661, ; 48: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 49: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 316
	i32 330147069, ; 50: Microsoft.SqlServer.Server => 0x13ada4fd => 213
	i32 342366114, ; 51: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 261
	i32 360082299, ; 52: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 53: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 54: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 55: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 56: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 57: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 58: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 59: _Microsoft.Android.Resource.Designer => 0x17969339 => 344
	i32 403441872, ; 60: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 61: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 336
	i32 422169404, ; 62: DataCore.dll => 0x1929cb3c => 342
	i32 441335492, ; 63: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 244
	i32 442565967, ; 64: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 65: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 257
	i32 451504562, ; 66: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 67: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 70: System.dll => 0x1bff388e => 164
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 259
	i32 485463106, ; 72: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 201
	i32 486930444, ; 73: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 272
	i32 489220957, ; 74: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 314
	i32 498788369, ; 75: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 76: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 198
	i32 526420162, ; 77: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 78: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 304
	i32 530272170, ; 79: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 80: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 335
	i32 539058512, ; 81: Microsoft.Extensions.Logging => 0x20216150 => 194
	i32 540030774, ; 82: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 83: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 84: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 548916678, ; 85: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 182
	i32 549171840, ; 86: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 87: Jsr305Binding => 0x213954e7 => 297
	i32 569601784, ; 88: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 295
	i32 577335427, ; 89: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 597488923, ; 90: CommunityToolkit.Maui => 0x239cf51b => 175
	i32 601371474, ; 91: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 92: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 93: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 94: Xamarin.AndroidX.CustomView => 0x2568904f => 249
	i32 627931235, ; 95: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 327
	i32 639843206, ; 96: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 255
	i32 643868501, ; 97: System.Net => 0x2660a755 => 81
	i32 662205335, ; 98: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 99: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 291
	i32 666292255, ; 100: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 236
	i32 672442732, ; 101: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 102: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 103: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 690969710, ; 104: ElroubyMauiLibrary.dll => 0x292f5c6e => 177
	i32 691348768, ; 105: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 306
	i32 693804605, ; 106: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 107: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 108: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 301
	i32 700358131, ; 109: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 110: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 305
	i32 722857257, ; 111: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 112: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 743023686, ; 113: OBControl.dll => 0x2c49a446 => 0
	i32 752232764, ; 114: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 115: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 226
	i32 759454413, ; 116: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 117: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775189201, ; 118: System.Data.SqlClient.dll => 0x2e3472d1 => 217
	i32 775507847, ; 119: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 120: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 333
	i32 789151979, ; 121: Microsoft.Extensions.Options => 0x2f0980eb => 197
	i32 790371945, ; 122: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 250
	i32 804715423, ; 123: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 264
	i32 809851609, ; 125: System.Drawing.Common.dll => 0x30455ad9 => 218
	i32 823281589, ; 126: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 127: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 128: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 129: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 130: Xamarin.AndroidX.Print => 0x3246f6cd => 277
	i32 869139383, ; 131: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 318
	i32 873119928, ; 132: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 133: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 134: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 135: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 332
	i32 904024072, ; 136: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 137: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 138: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 329
	i32 928116545, ; 139: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 300
	i32 932356562, ; 140: OBControl => 0x3792a1d2 => 0
	i32 952186615, ; 141: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 142: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 305
	i32 961460050, ; 143: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 322
	i32 966729478, ; 144: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 298
	i32 967690846, ; 145: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 261
	i32 975236339, ; 146: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 147: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 148: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 149: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 150: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 331
	i32 992768348, ; 151: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 152: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 153: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 154: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 281
	i32 1019214401, ; 155: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 156: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 193
	i32 1031528504, ; 157: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 299
	i32 1035644815, ; 158: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 234
	i32 1036536393, ; 159: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 160: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 312
	i32 1044663988, ; 161: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 162: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 268
	i32 1062017875, ; 163: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 200
	i32 1067306892, ; 164: GoogleGson => 0x3f9dcf8c => 181
	i32 1082857460, ; 165: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 166: Xamarin.Kotlin.StdLib => 0x409e66d8 => 302
	i32 1098259244, ; 167: System => 0x41761b2c => 164
	i32 1108272742, ; 168: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 334
	i32 1117529484, ; 169: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 328
	i32 1118262833, ; 170: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 324
	i32 1121599056, ; 171: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 267
	i32 1127624469, ; 172: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 196
	i32 1138436374, ; 173: Microsoft.Data.SqlClient.dll => 0x43db2916 => 183
	i32 1145483052, ; 174: System.Windows.Extensions.dll => 0x4446af2c => 224
	i32 1149092582, ; 175: Xamarin.AndroidX.Window => 0x447dc2e6 => 294
	i32 1157931901, ; 176: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 185
	i32 1168523401, ; 177: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 330
	i32 1170634674, ; 178: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 179: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 290
	i32 1178241025, ; 180: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 275
	i32 1202000627, ; 181: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 185
	i32 1204270330, ; 182: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 236
	i32 1204575371, ; 183: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 189
	i32 1208641965, ; 184: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 185: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 186: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 295
	i32 1253011324, ; 187: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 188: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 310
	i32 1264511973, ; 189: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 285
	i32 1267360935, ; 190: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 289
	i32 1273260888, ; 191: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 241
	i32 1275534314, ; 192: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 306
	i32 1278448581, ; 193: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 233
	i32 1291457549, ; 194: EntityFramework.SqlServer.dll => 0x4cfa140d => 178
	i32 1293217323, ; 195: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 252
	i32 1308624726, ; 196: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 319
	i32 1309188875, ; 197: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 198: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 294
	i32 1324164729, ; 199: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 200: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 201: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 339
	i32 1359611411, ; 202: FastMember.dll => 0x510a0613 => 180
	i32 1364015309, ; 203: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 204: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 340
	i32 1376866003, ; 205: Xamarin.AndroidX.SavedState => 0x52114ed3 => 281
	i32 1379779777, ; 206: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 207: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 208: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 245
	i32 1408764838, ; 209: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 210: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 211: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 212: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 308
	i32 1434145427, ; 213: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 214: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 298
	i32 1439761251, ; 215: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 216: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 217: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 218: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 219: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 220: System.IdentityModel.Tokens.Jwt => 0x57137723 => 219
	i32 1461004990, ; 221: es\Microsoft.Maui.Controls.resources => 0x57152abe => 314
	i32 1461234159, ; 222: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 223: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 224: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 225: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 235
	i32 1470490898, ; 226: Microsoft.Extensions.Primitives => 0x57a5e912 => 198
	i32 1479771757, ; 227: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 228: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 229: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 230: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 282
	i32 1498168481, ; 231: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 202
	i32 1521966082, ; 232: ElroubyMauiLibrary => 0x5ab75c02 => 177
	i32 1526286932, ; 233: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 338
	i32 1536373174, ; 234: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 235: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 236: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 237: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565310744, ; 238: System.Runtime.Caching => 0x5d4cbf18 => 221
	i32 1565862583, ; 239: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 240: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 241: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 242: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582305585, ; 243: Azure.Identity => 0x5e501131 => 174
	i32 1582372066, ; 244: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 251
	i32 1592978981, ; 245: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 246: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 299
	i32 1601112923, ; 247: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 248: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 249: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 250: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 271
	i32 1622358360, ; 251: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 252: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 293
	i32 1628113371, ; 253: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 205
	i32 1634654947, ; 254: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 176
	i32 1635184631, ; 255: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 255
	i32 1636350590, ; 256: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 248
	i32 1639515021, ; 257: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 258: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 259: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 260: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 261: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 287
	i32 1658251792, ; 262: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 296
	i32 1670060433, ; 263: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 243
	i32 1675553242, ; 264: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 265: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 266: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 267: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1689493916, ; 268: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 184
	i32 1691477237, ; 269: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 270: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 271: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 303
	i32 1701541528, ; 272: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 273: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 264
	i32 1726116996, ; 274: System.Reflection.dll => 0x66e27484 => 97
	i32 1726579627, ; 275: DataCore => 0x66e983ab => 342
	i32 1728033016, ; 276: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 277: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 239
	i32 1743415430, ; 278: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 309
	i32 1744735666, ; 279: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 280: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 281: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 282: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 283: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 284: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 285: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 286
	i32 1770582343, ; 286: Microsoft.Extensions.Logging.dll => 0x6988f147 => 194
	i32 1776026572, ; 287: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 288: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 289: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 290: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 325
	i32 1788241197, ; 291: Xamarin.AndroidX.Fragment => 0x6a96652d => 257
	i32 1793755602, ; 292: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 317
	i32 1794500907, ; 293: Microsoft.Identity.Client.dll => 0x6af5e92b => 199
	i32 1796167890, ; 294: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 182
	i32 1808609942, ; 295: Xamarin.AndroidX.Loader => 0x6bcd3296 => 271
	i32 1813058853, ; 296: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 302
	i32 1813201214, ; 297: Xamarin.Google.Android.Material => 0x6c13413e => 296
	i32 1818569960, ; 298: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 276
	i32 1818787751, ; 299: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 300: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 301: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 302: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 195
	i32 1829150748, ; 303: System.Windows.Extensions => 0x6d06a01c => 224
	i32 1847515442, ; 304: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 226
	i32 1853025655, ; 305: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 334
	i32 1858542181, ; 306: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 307: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1871986876, ; 308: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 205
	i32 1875935024, ; 309: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 316
	i32 1879696579, ; 310: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 311: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 237
	i32 1888955245, ; 312: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 313: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 314: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 310
	i32 1898237753, ; 315: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 316: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 317: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1927897671, ; 318: System.CodeDom.dll => 0x72e96247 => 215
	i32 1939592360, ; 319: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 320: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 321
	i32 1956758971, ; 321: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 322: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 283
	i32 1968388702, ; 323: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 190
	i32 1983156543, ; 324: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 303
	i32 1985761444, ; 325: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 228
	i32 1986222447, ; 326: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 206
	i32 2003115576, ; 327: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 313
	i32 2011961780, ; 328: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 329: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 268
	i32 2031763787, ; 330: Xamarin.Android.Glide => 0x791a414b => 225
	i32 2040764568, ; 331: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 200
	i32 2045470958, ; 332: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 333: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 263
	i32 2060060697, ; 334: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 335: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 312
	i32 2070888862, ; 336: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 337: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 338: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 339: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 340: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 341: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 342: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 343: Microsoft.Maui => 0x80bd55ad => 210
	i32 2169148018, ; 344: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 320
	i32 2178612968, ; 345: System.CodeDom => 0x81dafee8 => 215
	i32 2181898931, ; 346: Microsoft.Extensions.Options.dll => 0x820d22b3 => 197
	i32 2192057212, ; 347: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 195
	i32 2193016926, ; 348: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 349: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 307
	i32 2201231467, ; 350: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 351: it\Microsoft.Maui.Controls.resources => 0x839595db => 322
	i32 2217644978, ; 352: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 290
	i32 2222056684, ; 353: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 354: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 272
	i32 2252106437, ; 355: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 356: Microsoft.EntityFrameworkCore => 0x86487ec9 => 184
	i32 2253551641, ; 357: Microsoft.IdentityModel.Protocols => 0x86527819 => 204
	i32 2256313426, ; 358: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 359: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 360: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 191
	i32 2267999099, ; 361: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 227
	i32 2279755925, ; 362: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 279
	i32 2293034957, ; 363: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 364: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 365: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 366: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 326
	i32 2305521784, ; 367: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 368: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 231
	i32 2320631194, ; 369: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 370: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 371: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 372: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 373: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 320
	i32 2368005991, ; 374: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 375: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 203
	i32 2371007202, ; 376: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 190
	i32 2378619854, ; 377: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 378: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 379: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 321
	i32 2401565422, ; 380: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 381: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 254
	i32 2421380589, ; 382: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 383: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 241
	i32 2427813419, ; 384: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 318
	i32 2435356389, ; 385: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 386: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 387: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 388: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 389: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 390: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 244
	i32 2471841756, ; 391: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 392: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 393: Microsoft.Maui.Controls => 0x93dba8a1 => 208
	i32 2483903535, ; 394: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 395: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 396: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 397: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 398: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 324
	i32 2505896520, ; 399: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 266
	i32 2522472828, ; 400: Xamarin.Android.Glide.dll => 0x9659e17c => 225
	i32 2538310050, ; 401: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 402: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 319
	i32 2562349572, ; 403: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 404: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 405: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 323
	i32 2581783588, ; 406: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 267
	i32 2581819634, ; 407: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 289
	i32 2585220780, ; 408: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 409: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 410: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 411: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 328
	i32 2605712449, ; 412: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 307
	i32 2615233544, ; 413: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 258
	i32 2616218305, ; 414: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 196
	i32 2617129537, ; 415: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 416: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 417: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 248
	i32 2624644809, ; 418: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 253
	i32 2626831493, ; 419: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 323
	i32 2627185994, ; 420: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2628210652, ; 421: System.Memory.Data => 0x9ca74fdc => 220
	i32 2629843544, ; 422: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 423: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 262
	i32 2634653062, ; 424: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 186
	i32 2640290731, ; 425: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 203
	i32 2640706905, ; 426: Azure.Core => 0x9d65fd59 => 173
	i32 2660759594, ; 427: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 222
	i32 2663391936, ; 428: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 227
	i32 2663698177, ; 429: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 430: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 431: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 432: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2677098746, ; 433: Azure.Identity.dll => 0x9f9148fa => 174
	i32 2686887180, ; 434: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 435: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 436: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 287
	i32 2715334215, ; 437: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 438: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 439: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 440: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732517010, ; 441: FastMember => 0xa2dee692 => 180
	i32 2732626843, ; 442: Xamarin.AndroidX.Activity => 0xa2e0939b => 229
	i32 2735172069, ; 443: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 444: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 235
	i32 2740051746, ; 445: Microsoft.Identity.Client => 0xa351df22 => 199
	i32 2740698338, ; 446: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 309
	i32 2740948882, ; 447: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 448: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 449: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 329
	i32 2755098380, ; 450: Microsoft.SqlServer.Server.dll => 0xa437770c => 213
	i32 2755643133, ; 451: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 187
	i32 2758225723, ; 452: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 209
	i32 2764765095, ; 453: Microsoft.Maui.dll => 0xa4caf7a7 => 210
	i32 2765824710, ; 454: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 455: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 301
	i32 2778768386, ; 456: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 292
	i32 2779977773, ; 457: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 280
	i32 2785988530, ; 458: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 335
	i32 2788224221, ; 459: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 258
	i32 2795666278, ; 460: Microsoft.Win32.SystemEvents => 0xa6a27b66 => 214
	i32 2801831435, ; 461: Microsoft.Maui.Graphics => 0xa7008e0b => 212
	i32 2803228030, ; 462: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 463: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 245
	i32 2819470561, ; 464: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 465: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 466: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 280
	i32 2824502124, ; 467: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2838993487, ; 468: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 269
	i32 2841355853, ; 469: System.Security.Permissions => 0xa95ba64d => 223
	i32 2847789619, ; 470: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 186
	i32 2849599387, ; 471: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 472: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 292
	i32 2855708567, ; 473: Xamarin.AndroidX.Transition => 0xaa36a797 => 288
	i32 2861098320, ; 474: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 475: Microsoft.Maui.Essentials => 0xaa8a4878 => 211
	i32 2867946736, ; 476: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 222
	i32 2868488919, ; 477: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 176
	i32 2870099610, ; 478: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 230
	i32 2875164099, ; 479: Jsr305Binding.dll => 0xab5f85c3 => 297
	i32 2875220617, ; 480: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 481: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 256
	i32 2887636118, ; 482: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 483: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 484: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 485: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 486: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 487: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916751541, ; 488: EntityFramework => 0xadda18b5 => 179
	i32 2916838712, ; 489: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 293
	i32 2919462931, ; 490: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 491: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 232
	i32 2936416060, ; 492: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 493: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 494: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 495: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 216
	i32 2959614098, ; 496: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 497: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 498: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 499: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 252
	i32 2987532451, ; 500: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 283
	i32 2996846495, ; 501: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 265
	i32 3012788804, ; 502: System.Configuration.ConfigurationManager => 0xb3938244 => 216
	i32 3016983068, ; 503: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 285
	i32 3023353419, ; 504: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 505: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 260
	i32 3033605958, ; 506: System.Memory.Data.dll => 0xb4d12746 => 220
	i32 3038032645, ; 507: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 344
	i32 3053864966, ; 508: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 315
	i32 3056245963, ; 509: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 282
	i32 3057625584, ; 510: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 273
	i32 3059408633, ; 511: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 512: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 513: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 188
	i32 3075834255, ; 514: System.Threading.Tasks => 0xb755818f => 144
	i32 3084678329, ; 515: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 206
	i32 3090735792, ; 516: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 517: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 518: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 519: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 520: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 521: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 522: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 523: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 524: GoogleGson.dll => 0xbba64c02 => 181
	i32 3159123045, ; 525: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 526: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 527: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 274
	i32 3192346100, ; 528: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 529: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 530: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 188
	i32 3204380047, ; 531: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 532: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 533: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 251
	i32 3213246214, ; 534: System.Security.Permissions.dll => 0xbf863f06 => 223
	i32 3220365878, ; 535: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 536: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 537: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 538: Xamarin.AndroidX.CardView => 0xc235e84d => 239
	i32 3265493905, ; 539: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 540: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 541: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 542: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 543: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 544: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 545: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 546: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 547: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 315
	i32 3312457198, ; 548: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 202
	i32 3316684772, ; 549: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 550: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 249
	i32 3317144872, ; 551: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 552: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 237
	i32 3345895724, ; 553: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 278
	i32 3346324047, ; 554: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 275
	i32 3357674450, ; 555: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 332
	i32 3358260929, ; 556: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 557: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 230
	i32 3362522851, ; 558: Xamarin.AndroidX.Core => 0xc86c06e3 => 246
	i32 3366347497, ; 559: Java.Interop => 0xc8a662e9 => 168
	i32 3374879918, ; 560: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 204
	i32 3374999561, ; 561: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 279
	i32 3381016424, ; 562: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 311
	i32 3395150330, ; 563: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 564: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 565: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 250
	i32 3428513518, ; 566: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 192
	i32 3429136800, ; 567: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 568: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 569: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 253
	i32 3445260447, ; 570: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 571: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 207
	i32 3458724246, ; 572: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 330
	i32 3471940407, ; 573: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 574: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 575: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 331
	i32 3485117614, ; 576: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 577: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 578: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 242
	i32 3509114376, ; 579: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 580: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 581: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 582: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3545306353, ; 583: Microsoft.Data.SqlClient => 0xd35114f1 => 183
	i32 3560100363, ; 584: System.Threading.Timer => 0xd432d20b => 147
	i32 3561949811, ; 585: Azure.Core.dll => 0xd44f0a73 => 173
	i32 3570554715, ; 586: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3570608287, ; 587: System.Runtime.Caching.dll => 0xd4d3289f => 221
	i32 3580758918, ; 588: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 339
	i32 3592228221, ; 589: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 341
	i32 3597029428, ; 590: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 228
	i32 3598340787, ; 591: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 592: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 593: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 594: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 277
	i32 3633644679, ; 595: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 232
	i32 3638274909, ; 596: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 597: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 263
	i32 3643446276, ; 598: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 336
	i32 3643854240, ; 599: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 274
	i32 3645089577, ; 600: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3653734595, ; 601: EntityFramework.dll => 0xd9c790c3 => 179
	i32 3657292374, ; 602: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 191
	i32 3660523487, ; 603: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 604: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 605: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 238
	i32 3684561358, ; 606: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 242
	i32 3689375977, ; 607: System.Drawing.Common => 0xdbe768e9 => 218
	i32 3700591436, ; 608: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 201
	i32 3700866549, ; 609: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 610: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 247
	i32 3716563718, ; 611: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 612: Xamarin.AndroidX.Annotation => 0xdda814c6 => 231
	i32 3724971120, ; 613: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 273
	i32 3732100267, ; 614: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 615: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 616: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 617: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 618: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 311
	i32 3757377913, ; 619: EntityFramework.SqlServer => 0xdff50979 => 178
	i32 3786282454, ; 620: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 240
	i32 3792276235, ; 621: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 622: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 207
	i32 3802395368, ; 623: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 624: CommunityToolkit.Maui.dll => 0xe3886bf7 => 175
	i32 3819260425, ; 625: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 626: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 627: System.Numerics.dll => 0xe4436460 => 83
	i32 3834665012, ; 628: System.Data.SqlClient => 0xe4905834 => 217
	i32 3841636137, ; 629: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 193
	i32 3844307129, ; 630: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 631: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 632: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 633: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 634: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 635: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 636: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 288
	i32 3888767677, ; 637: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 278
	i32 3896106733, ; 638: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 639: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 246
	i32 3901907137, ; 640: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 641: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 327
	i32 3920810846, ; 642: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 643: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 291
	i32 3928044579, ; 644: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 645: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 646: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 276
	i32 3945713374, ; 647: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 648: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 649: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 234
	i32 3959773229, ; 650: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 265
	i32 3993904643, ; 651: ElroubyMauiLibraryPlus => 0xee0e2603 => 343
	i32 4003436829, ; 652: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 653: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 233
	i32 4025784931, ; 654: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 655: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 209
	i32 4054681211, ; 656: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 657: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 658: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 659: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 313
	i32 4094352644, ; 660: Microsoft.Maui.Essentials.dll => 0xf40add04 => 211
	i32 4099507663, ; 661: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 662: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 663: Xamarin.AndroidX.Emoji2 => 0xf479582c => 254
	i32 4101842092, ; 664: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 189
	i32 4103439459, ; 665: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 337
	i32 4126470640, ; 666: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 192
	i32 4127667938, ; 667: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 668: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 669: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 670: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 337
	i32 4151237749, ; 671: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 672: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 673: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 674: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 675: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 676: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 270
	i32 4185676441, ; 677: System.Security => 0xf97c5a99 => 130
	i32 4194278001, ; 678: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 187
	i32 4196529839, ; 679: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 680: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 681: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 326
	i32 4256097574, ; 682: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 247
	i32 4258378803, ; 683: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 269
	i32 4260525087, ; 684: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 685: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 219
	i32 4271975918, ; 686: Microsoft.Maui.Controls.dll => 0xfea12dee => 208
	i32 4274976490, ; 687: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 688: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 270
	i32 4294763496 ; 689: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 256
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [690 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 266, ; 3
	i32 300, ; 4
	i32 48, ; 5
	i32 308, ; 6
	i32 80, ; 7
	i32 317, ; 8
	i32 145, ; 9
	i32 343, ; 10
	i32 214, ; 11
	i32 30, ; 12
	i32 341, ; 13
	i32 124, ; 14
	i32 212, ; 15
	i32 102, ; 16
	i32 325, ; 17
	i32 284, ; 18
	i32 107, ; 19
	i32 284, ; 20
	i32 139, ; 21
	i32 304, ; 22
	i32 340, ; 23
	i32 333, ; 24
	i32 77, ; 25
	i32 124, ; 26
	i32 13, ; 27
	i32 240, ; 28
	i32 132, ; 29
	i32 286, ; 30
	i32 151, ; 31
	i32 18, ; 32
	i32 238, ; 33
	i32 26, ; 34
	i32 260, ; 35
	i32 1, ; 36
	i32 59, ; 37
	i32 42, ; 38
	i32 91, ; 39
	i32 243, ; 40
	i32 147, ; 41
	i32 262, ; 42
	i32 259, ; 43
	i32 54, ; 44
	i32 69, ; 45
	i32 338, ; 46
	i32 229, ; 47
	i32 83, ; 48
	i32 316, ; 49
	i32 213, ; 50
	i32 261, ; 51
	i32 131, ; 52
	i32 55, ; 53
	i32 149, ; 54
	i32 74, ; 55
	i32 145, ; 56
	i32 62, ; 57
	i32 146, ; 58
	i32 344, ; 59
	i32 165, ; 60
	i32 336, ; 61
	i32 342, ; 62
	i32 244, ; 63
	i32 12, ; 64
	i32 257, ; 65
	i32 125, ; 66
	i32 152, ; 67
	i32 113, ; 68
	i32 166, ; 69
	i32 164, ; 70
	i32 259, ; 71
	i32 201, ; 72
	i32 272, ; 73
	i32 314, ; 74
	i32 84, ; 75
	i32 198, ; 76
	i32 150, ; 77
	i32 304, ; 78
	i32 60, ; 79
	i32 335, ; 80
	i32 194, ; 81
	i32 51, ; 82
	i32 103, ; 83
	i32 114, ; 84
	i32 182, ; 85
	i32 40, ; 86
	i32 297, ; 87
	i32 295, ; 88
	i32 120, ; 89
	i32 175, ; 90
	i32 52, ; 91
	i32 44, ; 92
	i32 119, ; 93
	i32 249, ; 94
	i32 327, ; 95
	i32 255, ; 96
	i32 81, ; 97
	i32 136, ; 98
	i32 291, ; 99
	i32 236, ; 100
	i32 8, ; 101
	i32 73, ; 102
	i32 155, ; 103
	i32 177, ; 104
	i32 306, ; 105
	i32 154, ; 106
	i32 92, ; 107
	i32 301, ; 108
	i32 45, ; 109
	i32 305, ; 110
	i32 109, ; 111
	i32 129, ; 112
	i32 0, ; 113
	i32 25, ; 114
	i32 226, ; 115
	i32 72, ; 116
	i32 55, ; 117
	i32 217, ; 118
	i32 46, ; 119
	i32 333, ; 120
	i32 197, ; 121
	i32 250, ; 122
	i32 22, ; 123
	i32 264, ; 124
	i32 218, ; 125
	i32 86, ; 126
	i32 43, ; 127
	i32 160, ; 128
	i32 71, ; 129
	i32 277, ; 130
	i32 318, ; 131
	i32 3, ; 132
	i32 42, ; 133
	i32 63, ; 134
	i32 332, ; 135
	i32 16, ; 136
	i32 53, ; 137
	i32 329, ; 138
	i32 300, ; 139
	i32 0, ; 140
	i32 105, ; 141
	i32 305, ; 142
	i32 322, ; 143
	i32 298, ; 144
	i32 261, ; 145
	i32 34, ; 146
	i32 158, ; 147
	i32 85, ; 148
	i32 32, ; 149
	i32 331, ; 150
	i32 12, ; 151
	i32 51, ; 152
	i32 56, ; 153
	i32 281, ; 154
	i32 36, ; 155
	i32 193, ; 156
	i32 299, ; 157
	i32 234, ; 158
	i32 35, ; 159
	i32 312, ; 160
	i32 58, ; 161
	i32 268, ; 162
	i32 200, ; 163
	i32 181, ; 164
	i32 17, ; 165
	i32 302, ; 166
	i32 164, ; 167
	i32 334, ; 168
	i32 328, ; 169
	i32 324, ; 170
	i32 267, ; 171
	i32 196, ; 172
	i32 183, ; 173
	i32 224, ; 174
	i32 294, ; 175
	i32 185, ; 176
	i32 330, ; 177
	i32 153, ; 178
	i32 290, ; 179
	i32 275, ; 180
	i32 185, ; 181
	i32 236, ; 182
	i32 189, ; 183
	i32 29, ; 184
	i32 52, ; 185
	i32 295, ; 186
	i32 5, ; 187
	i32 310, ; 188
	i32 285, ; 189
	i32 289, ; 190
	i32 241, ; 191
	i32 306, ; 192
	i32 233, ; 193
	i32 178, ; 194
	i32 252, ; 195
	i32 319, ; 196
	i32 85, ; 197
	i32 294, ; 198
	i32 61, ; 199
	i32 112, ; 200
	i32 339, ; 201
	i32 180, ; 202
	i32 57, ; 203
	i32 340, ; 204
	i32 281, ; 205
	i32 99, ; 206
	i32 19, ; 207
	i32 245, ; 208
	i32 111, ; 209
	i32 101, ; 210
	i32 102, ; 211
	i32 308, ; 212
	i32 104, ; 213
	i32 298, ; 214
	i32 71, ; 215
	i32 38, ; 216
	i32 32, ; 217
	i32 103, ; 218
	i32 73, ; 219
	i32 219, ; 220
	i32 314, ; 221
	i32 9, ; 222
	i32 123, ; 223
	i32 46, ; 224
	i32 235, ; 225
	i32 198, ; 226
	i32 9, ; 227
	i32 43, ; 228
	i32 4, ; 229
	i32 282, ; 230
	i32 202, ; 231
	i32 177, ; 232
	i32 338, ; 233
	i32 31, ; 234
	i32 138, ; 235
	i32 92, ; 236
	i32 93, ; 237
	i32 221, ; 238
	i32 49, ; 239
	i32 141, ; 240
	i32 112, ; 241
	i32 140, ; 242
	i32 174, ; 243
	i32 251, ; 244
	i32 115, ; 245
	i32 299, ; 246
	i32 157, ; 247
	i32 76, ; 248
	i32 79, ; 249
	i32 271, ; 250
	i32 37, ; 251
	i32 293, ; 252
	i32 205, ; 253
	i32 176, ; 254
	i32 255, ; 255
	i32 248, ; 256
	i32 64, ; 257
	i32 138, ; 258
	i32 15, ; 259
	i32 116, ; 260
	i32 287, ; 261
	i32 296, ; 262
	i32 243, ; 263
	i32 48, ; 264
	i32 70, ; 265
	i32 80, ; 266
	i32 126, ; 267
	i32 184, ; 268
	i32 94, ; 269
	i32 121, ; 270
	i32 303, ; 271
	i32 26, ; 272
	i32 264, ; 273
	i32 97, ; 274
	i32 342, ; 275
	i32 28, ; 276
	i32 239, ; 277
	i32 309, ; 278
	i32 149, ; 279
	i32 169, ; 280
	i32 4, ; 281
	i32 98, ; 282
	i32 33, ; 283
	i32 93, ; 284
	i32 286, ; 285
	i32 194, ; 286
	i32 21, ; 287
	i32 41, ; 288
	i32 170, ; 289
	i32 325, ; 290
	i32 257, ; 291
	i32 317, ; 292
	i32 199, ; 293
	i32 182, ; 294
	i32 271, ; 295
	i32 302, ; 296
	i32 296, ; 297
	i32 276, ; 298
	i32 2, ; 299
	i32 134, ; 300
	i32 111, ; 301
	i32 195, ; 302
	i32 224, ; 303
	i32 226, ; 304
	i32 334, ; 305
	i32 58, ; 306
	i32 95, ; 307
	i32 205, ; 308
	i32 316, ; 309
	i32 39, ; 310
	i32 237, ; 311
	i32 25, ; 312
	i32 94, ; 313
	i32 310, ; 314
	i32 89, ; 315
	i32 99, ; 316
	i32 10, ; 317
	i32 215, ; 318
	i32 87, ; 319
	i32 321, ; 320
	i32 100, ; 321
	i32 283, ; 322
	i32 190, ; 323
	i32 303, ; 324
	i32 228, ; 325
	i32 206, ; 326
	i32 313, ; 327
	i32 7, ; 328
	i32 268, ; 329
	i32 225, ; 330
	i32 200, ; 331
	i32 88, ; 332
	i32 263, ; 333
	i32 154, ; 334
	i32 312, ; 335
	i32 33, ; 336
	i32 116, ; 337
	i32 82, ; 338
	i32 20, ; 339
	i32 11, ; 340
	i32 162, ; 341
	i32 3, ; 342
	i32 210, ; 343
	i32 320, ; 344
	i32 215, ; 345
	i32 197, ; 346
	i32 195, ; 347
	i32 84, ; 348
	i32 307, ; 349
	i32 64, ; 350
	i32 322, ; 351
	i32 290, ; 352
	i32 143, ; 353
	i32 272, ; 354
	i32 157, ; 355
	i32 184, ; 356
	i32 204, ; 357
	i32 41, ; 358
	i32 117, ; 359
	i32 191, ; 360
	i32 227, ; 361
	i32 279, ; 362
	i32 131, ; 363
	i32 75, ; 364
	i32 66, ; 365
	i32 326, ; 366
	i32 172, ; 367
	i32 231, ; 368
	i32 143, ; 369
	i32 106, ; 370
	i32 151, ; 371
	i32 70, ; 372
	i32 320, ; 373
	i32 156, ; 374
	i32 203, ; 375
	i32 190, ; 376
	i32 121, ; 377
	i32 127, ; 378
	i32 321, ; 379
	i32 152, ; 380
	i32 254, ; 381
	i32 141, ; 382
	i32 241, ; 383
	i32 318, ; 384
	i32 20, ; 385
	i32 14, ; 386
	i32 135, ; 387
	i32 75, ; 388
	i32 59, ; 389
	i32 244, ; 390
	i32 167, ; 391
	i32 168, ; 392
	i32 208, ; 393
	i32 15, ; 394
	i32 74, ; 395
	i32 6, ; 396
	i32 23, ; 397
	i32 324, ; 398
	i32 266, ; 399
	i32 225, ; 400
	i32 91, ; 401
	i32 319, ; 402
	i32 1, ; 403
	i32 136, ; 404
	i32 323, ; 405
	i32 267, ; 406
	i32 289, ; 407
	i32 134, ; 408
	i32 69, ; 409
	i32 146, ; 410
	i32 328, ; 411
	i32 307, ; 412
	i32 258, ; 413
	i32 196, ; 414
	i32 88, ; 415
	i32 96, ; 416
	i32 248, ; 417
	i32 253, ; 418
	i32 323, ; 419
	i32 31, ; 420
	i32 220, ; 421
	i32 45, ; 422
	i32 262, ; 423
	i32 186, ; 424
	i32 203, ; 425
	i32 173, ; 426
	i32 222, ; 427
	i32 227, ; 428
	i32 109, ; 429
	i32 158, ; 430
	i32 35, ; 431
	i32 22, ; 432
	i32 174, ; 433
	i32 114, ; 434
	i32 57, ; 435
	i32 287, ; 436
	i32 144, ; 437
	i32 118, ; 438
	i32 120, ; 439
	i32 110, ; 440
	i32 180, ; 441
	i32 229, ; 442
	i32 139, ; 443
	i32 235, ; 444
	i32 199, ; 445
	i32 309, ; 446
	i32 54, ; 447
	i32 105, ; 448
	i32 329, ; 449
	i32 213, ; 450
	i32 187, ; 451
	i32 209, ; 452
	i32 210, ; 453
	i32 133, ; 454
	i32 301, ; 455
	i32 292, ; 456
	i32 280, ; 457
	i32 335, ; 458
	i32 258, ; 459
	i32 214, ; 460
	i32 212, ; 461
	i32 159, ; 462
	i32 245, ; 463
	i32 163, ; 464
	i32 132, ; 465
	i32 280, ; 466
	i32 161, ; 467
	i32 269, ; 468
	i32 223, ; 469
	i32 186, ; 470
	i32 140, ; 471
	i32 292, ; 472
	i32 288, ; 473
	i32 169, ; 474
	i32 211, ; 475
	i32 222, ; 476
	i32 176, ; 477
	i32 230, ; 478
	i32 297, ; 479
	i32 40, ; 480
	i32 256, ; 481
	i32 81, ; 482
	i32 56, ; 483
	i32 37, ; 484
	i32 97, ; 485
	i32 166, ; 486
	i32 172, ; 487
	i32 179, ; 488
	i32 293, ; 489
	i32 82, ; 490
	i32 232, ; 491
	i32 98, ; 492
	i32 30, ; 493
	i32 159, ; 494
	i32 216, ; 495
	i32 18, ; 496
	i32 127, ; 497
	i32 119, ; 498
	i32 252, ; 499
	i32 283, ; 500
	i32 265, ; 501
	i32 216, ; 502
	i32 285, ; 503
	i32 165, ; 504
	i32 260, ; 505
	i32 220, ; 506
	i32 344, ; 507
	i32 315, ; 508
	i32 282, ; 509
	i32 273, ; 510
	i32 170, ; 511
	i32 16, ; 512
	i32 188, ; 513
	i32 144, ; 514
	i32 206, ; 515
	i32 125, ; 516
	i32 118, ; 517
	i32 38, ; 518
	i32 115, ; 519
	i32 47, ; 520
	i32 142, ; 521
	i32 117, ; 522
	i32 34, ; 523
	i32 181, ; 524
	i32 95, ; 525
	i32 53, ; 526
	i32 274, ; 527
	i32 129, ; 528
	i32 153, ; 529
	i32 188, ; 530
	i32 24, ; 531
	i32 161, ; 532
	i32 251, ; 533
	i32 223, ; 534
	i32 148, ; 535
	i32 104, ; 536
	i32 89, ; 537
	i32 239, ; 538
	i32 60, ; 539
	i32 142, ; 540
	i32 100, ; 541
	i32 5, ; 542
	i32 13, ; 543
	i32 122, ; 544
	i32 135, ; 545
	i32 28, ; 546
	i32 315, ; 547
	i32 202, ; 548
	i32 72, ; 549
	i32 249, ; 550
	i32 24, ; 551
	i32 237, ; 552
	i32 278, ; 553
	i32 275, ; 554
	i32 332, ; 555
	i32 137, ; 556
	i32 230, ; 557
	i32 246, ; 558
	i32 168, ; 559
	i32 204, ; 560
	i32 279, ; 561
	i32 311, ; 562
	i32 101, ; 563
	i32 123, ; 564
	i32 250, ; 565
	i32 192, ; 566
	i32 163, ; 567
	i32 167, ; 568
	i32 253, ; 569
	i32 39, ; 570
	i32 207, ; 571
	i32 330, ; 572
	i32 17, ; 573
	i32 171, ; 574
	i32 331, ; 575
	i32 137, ; 576
	i32 150, ; 577
	i32 242, ; 578
	i32 155, ; 579
	i32 130, ; 580
	i32 19, ; 581
	i32 65, ; 582
	i32 183, ; 583
	i32 147, ; 584
	i32 173, ; 585
	i32 47, ; 586
	i32 221, ; 587
	i32 339, ; 588
	i32 341, ; 589
	i32 228, ; 590
	i32 79, ; 591
	i32 61, ; 592
	i32 106, ; 593
	i32 277, ; 594
	i32 232, ; 595
	i32 49, ; 596
	i32 263, ; 597
	i32 336, ; 598
	i32 274, ; 599
	i32 14, ; 600
	i32 179, ; 601
	i32 191, ; 602
	i32 68, ; 603
	i32 171, ; 604
	i32 238, ; 605
	i32 242, ; 606
	i32 218, ; 607
	i32 201, ; 608
	i32 78, ; 609
	i32 247, ; 610
	i32 108, ; 611
	i32 231, ; 612
	i32 273, ; 613
	i32 67, ; 614
	i32 63, ; 615
	i32 27, ; 616
	i32 160, ; 617
	i32 311, ; 618
	i32 178, ; 619
	i32 240, ; 620
	i32 10, ; 621
	i32 207, ; 622
	i32 11, ; 623
	i32 175, ; 624
	i32 78, ; 625
	i32 126, ; 626
	i32 83, ; 627
	i32 217, ; 628
	i32 193, ; 629
	i32 66, ; 630
	i32 107, ; 631
	i32 65, ; 632
	i32 128, ; 633
	i32 122, ; 634
	i32 77, ; 635
	i32 288, ; 636
	i32 278, ; 637
	i32 8, ; 638
	i32 246, ; 639
	i32 2, ; 640
	i32 327, ; 641
	i32 44, ; 642
	i32 291, ; 643
	i32 156, ; 644
	i32 128, ; 645
	i32 276, ; 646
	i32 23, ; 647
	i32 133, ; 648
	i32 234, ; 649
	i32 265, ; 650
	i32 343, ; 651
	i32 29, ; 652
	i32 233, ; 653
	i32 62, ; 654
	i32 209, ; 655
	i32 90, ; 656
	i32 87, ; 657
	i32 148, ; 658
	i32 313, ; 659
	i32 211, ; 660
	i32 36, ; 661
	i32 86, ; 662
	i32 254, ; 663
	i32 189, ; 664
	i32 337, ; 665
	i32 192, ; 666
	i32 50, ; 667
	i32 6, ; 668
	i32 90, ; 669
	i32 337, ; 670
	i32 21, ; 671
	i32 162, ; 672
	i32 96, ; 673
	i32 50, ; 674
	i32 113, ; 675
	i32 270, ; 676
	i32 130, ; 677
	i32 187, ; 678
	i32 76, ; 679
	i32 27, ; 680
	i32 326, ; 681
	i32 247, ; 682
	i32 269, ; 683
	i32 7, ; 684
	i32 219, ; 685
	i32 208, ; 686
	i32 110, ; 687
	i32 270, ; 688
	i32 256 ; 689
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
