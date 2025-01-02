; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [124 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [248 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 114
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 50
	i32 83839681, ; 5: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 109
	i32 136584136, ; 7: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 8: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 60
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 78
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 91
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 56
	i32 321963286, ; 14: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 67
	i32 347068432, ; 16: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 54
	i32 379916513, ; 17: System.Threading.Thread.dll => 0x16a510e1 => 114
	i32 385762202, ; 18: System.Memory.dll => 0x16fe439a => 99
	i32 395744057, ; 19: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 20: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 21: System.Collections => 0x1a61054f => 88
	i32 450948140, ; 22: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 66
	i32 456227837, ; 23: System.Web.HttpUtility.dll => 0x1b317bfd => 116
	i32 469710990, ; 24: System.dll => 0x1bff388e => 118
	i32 489220957, ; 25: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 26: System.ObjectModel => 0x1dbae811 => 105
	i32 513247710, ; 27: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 44
	i32 538707440, ; 28: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 29: Microsoft.Extensions.Logging => 0x20216150 => 41
	i32 597488923, ; 30: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 31: Xamarin.AndroidX.CustomView => 0x2568904f => 64
	i32 627931235, ; 32: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 33: System.Collections.Concurrent => 0x2814a96c => 85
	i32 722857257, ; 34: System.Runtime.Loader.dll => 0x2b15ed29 => 110
	i32 748832960, ; 35: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 52
	i32 759454413, ; 36: System.Net.Requests => 0x2d445acd => 103
	i32 775507847, ; 37: System.IO.Compression => 0x2e394f87 => 96
	i32 777317022, ; 38: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 39: Microsoft.Extensions.Options => 0x2f0980eb => 43
	i32 823281589, ; 40: System.Private.Uri.dll => 0x311247b5 => 106
	i32 830298997, ; 41: System.IO.Compression.Brotli => 0x317d5b75 => 95
	i32 869139383, ; 42: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 43: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 44: System.ComponentModel.Primitives.dll => 0x35e25008 => 89
	i32 918734561, ; 45: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 46: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 47: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 67
	i32 990727110, ; 48: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 49: System.Collections.dll => 0x3b2c715c => 88
	i32 1012816738, ; 50: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 77
	i32 1028951442, ; 51: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 40
	i32 1035644815, ; 52: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 57
	i32 1043950537, ; 53: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 54: System.Linq.Expressions.dll => 0x3e444eb4 => 97
	i32 1052210849, ; 55: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 69
	i32 1082857460, ; 56: System.ComponentModel.TypeConverter => 0x408b17f4 => 90
	i32 1084122840, ; 57: Xamarin.Kotlin.StdLib => 0x409e66d8 => 82
	i32 1098259244, ; 58: System => 0x41761b2c => 118
	i32 1108272742, ; 59: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 60: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 61: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 62: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 63: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 74
	i32 1260983243, ; 64: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 65: SQLitePCLRaw.core.dll => 0x4d0585a0 => 53
	i32 1293217323, ; 66: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 65
	i32 1308624726, ; 67: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 68: System.Linq => 0x4eed2679 => 98
	i32 1336711579, ; 69: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 70: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 71: Xamarin.AndroidX.SavedState => 0x52114ed3 => 77
	i32 1406073936, ; 72: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 61
	i32 1430672901, ; 73: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 74: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 75: System.Collections.Immutable.dll => 0x5718a9ef => 86
	i32 1462112819, ; 76: System.IO.Compression.dll => 0x57261233 => 96
	i32 1469204771, ; 77: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 58
	i32 1470490898, ; 78: Microsoft.Extensions.Primitives => 0x57a5e912 => 44
	i32 1479771757, ; 79: System.Collections.Immutable => 0x5833866d => 86
	i32 1480492111, ; 80: System.IO.Compression.Brotli.dll => 0x583e844f => 95
	i32 1526286932, ; 81: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 82: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 113
	i32 1543265843, ; 83: WorkoutApp.dll => 0x5bfc5e33 => 84
	i32 1622152042, ; 84: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 71
	i32 1624863272, ; 85: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 80
	i32 1634654947, ; 86: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 87: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 63
	i32 1639515021, ; 88: System.Net.Http.dll => 0x61b9038d => 100
	i32 1639986890, ; 89: System.Text.RegularExpressions => 0x61c036ca => 113
	i32 1657153582, ; 90: System.Runtime => 0x62c6282e => 111
	i32 1658251792, ; 91: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 81
	i32 1677501392, ; 92: System.Net.Primitives.dll => 0x63fca3d0 => 102
	i32 1679769178, ; 93: System.Security.Cryptography => 0x641f3e5a => 112
	i32 1711441057, ; 94: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 54
	i32 1729485958, ; 95: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 59
	i32 1743415430, ; 96: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 97: System.Diagnostics.TraceSource.dll => 0x69239124 => 94
	i32 1766324549, ; 98: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 78
	i32 1770582343, ; 99: Microsoft.Extensions.Logging.dll => 0x6988f147 => 41
	i32 1780572499, ; 100: Mono.Android.Runtime.dll => 0x6a216153 => 122
	i32 1782862114, ; 101: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 102: Xamarin.AndroidX.Fragment => 0x6a96652d => 66
	i32 1793755602, ; 103: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 104: Xamarin.AndroidX.Loader => 0x6bcd3296 => 71
	i32 1813058853, ; 105: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 82
	i32 1813201214, ; 106: Xamarin.Google.Android.Material => 0x6c13413e => 81
	i32 1818569960, ; 107: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 75
	i32 1828688058, ; 108: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 42
	i32 1853025655, ; 109: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 110: System.Linq.Expressions => 0x6ec71a65 => 97
	i32 1875935024, ; 111: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 112: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 113: System.Collections.NonGeneric.dll => 0x71dc7c8b => 87
	i32 1953182387, ; 114: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 115: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 37
	i32 2003115576, ; 116: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 117: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 69
	i32 2045470958, ; 118: System.Private.Xml => 0x79eb68ee => 107
	i32 2055257422, ; 119: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 68
	i32 2066184531, ; 120: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 121: System.Diagnostics.TraceSource => 0x7b6f419e => 94
	i32 2079903147, ; 122: System.Runtime.dll => 0x7bf8cdab => 111
	i32 2090596640, ; 123: System.Numerics.Vectors => 0x7c9bf920 => 104
	i32 2103459038, ; 124: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 55
	i32 2127167465, ; 125: System.Console => 0x7ec9ffe9 => 92
	i32 2159891885, ; 126: Microsoft.Maui => 0x80bd55ad => 48
	i32 2169148018, ; 127: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 128: Microsoft.Extensions.Options.dll => 0x820d22b3 => 43
	i32 2192057212, ; 129: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 42
	i32 2193016926, ; 130: System.ObjectModel.dll => 0x82b6c85e => 105
	i32 2201107256, ; 131: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 83
	i32 2201231467, ; 132: System.Net.Http => 0x8334206b => 100
	i32 2207618523, ; 133: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 134: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 38
	i32 2279755925, ; 135: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 76
	i32 2298471582, ; 136: System.Net.Mail => 0x88ffe49e => 101
	i32 2303942373, ; 137: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 138: System.Private.CoreLib.dll => 0x896b7878 => 120
	i32 2340441535, ; 139: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 108
	i32 2353062107, ; 140: System.Net.Primitives => 0x8c40e0db => 102
	i32 2366048013, ; 141: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 142: System.Xml.ReaderWriter.dll => 0x8d24e767 => 117
	i32 2371007202, ; 143: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 37
	i32 2395872292, ; 144: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 145: System.Web.HttpUtility => 0x8f24faee => 116
	i32 2427813419, ; 146: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 147: System.Console.dll => 0x912896e5 => 92
	i32 2465273461, ; 148: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 52
	i32 2471841756, ; 149: netstandard.dll => 0x93554fdc => 119
	i32 2475788418, ; 150: Java.Interop.dll => 0x93918882 => 121
	i32 2480646305, ; 151: Microsoft.Maui.Controls => 0x93dba8a1 => 46
	i32 2503351294, ; 152: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2550873716, ; 153: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2576534780, ; 154: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2593496499, ; 155: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 156: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 83
	i32 2617129537, ; 157: System.Private.Xml.dll => 0x9bfe3a41 => 107
	i32 2620871830, ; 158: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 63
	i32 2626831493, ; 159: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 160: System.Runtime.Loader => 0x9ec4cf01 => 110
	i32 2732626843, ; 161: Xamarin.AndroidX.Activity => 0xa2e0939b => 56
	i32 2737747696, ; 162: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 58
	i32 2740698338, ; 163: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 164: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 165: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 47
	i32 2764765095, ; 166: Microsoft.Maui.dll => 0xa4caf7a7 => 48
	i32 2778768386, ; 167: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 79
	i32 2785988530, ; 168: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 169: Microsoft.Maui.Graphics => 0xa7008e0b => 50
	i32 2810250172, ; 170: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 61
	i32 2853208004, ; 171: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 79
	i32 2861189240, ; 172: Microsoft.Maui.Essentials => 0xaa8a4878 => 49
	i32 2868488919, ; 173: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 174: System.Private.CoreLib => 0xad6f1e8a => 120
	i32 2916838712, ; 175: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 80
	i32 2919462931, ; 176: System.Numerics.Vectors.dll => 0xae037813 => 104
	i32 2959614098, ; 177: System.ComponentModel.dll => 0xb0682092 => 91
	i32 2978675010, ; 178: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 65
	i32 3038032645, ; 179: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 180: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 181: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 72
	i32 3059408633, ; 182: Mono.Android.Runtime => 0xb65adef9 => 122
	i32 3059793426, ; 183: System.ComponentModel.Primitives => 0xb660be12 => 89
	i32 3178803400, ; 184: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 73
	i32 3220365878, ; 185: System.Threading => 0xbff2e236 => 115
	i32 3258312781, ; 186: Xamarin.AndroidX.CardView => 0xc235e84d => 59
	i32 3286872994, ; 187: SQLite-net.dll => 0xc3e9b3a2 => 51
	i32 3305363605, ; 188: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 189: System.Net.Requests.dll => 0xc5b097e4 => 103
	i32 3317135071, ; 190: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 64
	i32 3346324047, ; 191: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 74
	i32 3357674450, ; 192: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3360279109, ; 193: SQLitePCLRaw.core => 0xc849ca45 => 53
	i32 3362522851, ; 194: Xamarin.AndroidX.Core => 0xc86c06e3 => 62
	i32 3366347497, ; 195: Java.Interop => 0xc8a662e9 => 121
	i32 3374999561, ; 196: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 76
	i32 3381016424, ; 197: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 198: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 39
	i32 3430777524, ; 199: netstandard => 0xcc7d82b4 => 119
	i32 3452344032, ; 200: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 45
	i32 3458724246, ; 201: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 202: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 90
	i32 3476120550, ; 203: Mono.Android => 0xcf3163e6 => 123
	i32 3484440000, ; 204: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3580758918, ; 205: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 206: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 207: System.Linq.dll => 0xd715a361 => 98
	i32 3624195450, ; 208: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 108
	i32 3641597786, ; 209: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 68
	i32 3643446276, ; 210: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 211: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 73
	i32 3657292374, ; 212: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 38
	i32 3672681054, ; 213: Mono.Android.dll => 0xdae8aa5e => 123
	i32 3687945346, ; 214: WorkoutApp => 0xdbd19482 => 84
	i32 3724971120, ; 215: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 72
	i32 3748608112, ; 216: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 93
	i32 3751619990, ; 217: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3754567612, ; 218: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 55
	i32 3786282454, ; 219: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 60
	i32 3792276235, ; 220: System.Collections.NonGeneric => 0xe2098b0b => 87
	i32 3800979733, ; 221: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 45
	i32 3817368567, ; 222: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 223: System.Security.Cryptography.dll => 0xe3df9d2b => 112
	i32 3841636137, ; 224: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 40
	i32 3844307129, ; 225: System.Net.Mail.dll => 0xe52378b9 => 101
	i32 3849253459, ; 226: System.Runtime.InteropServices.dll => 0xe56ef253 => 109
	i32 3876362041, ; 227: SQLite-net => 0xe70c9739 => 51
	i32 3896106733, ; 228: System.Collections.Concurrent.dll => 0xe839deed => 85
	i32 3896760992, ; 229: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 62
	i32 3920221145, ; 230: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 231: System.Xml.ReaderWriter => 0xea213423 => 117
	i32 3931092270, ; 232: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 75
	i32 3955647286, ; 233: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 57
	i32 4025784931, ; 234: System.Memory => 0xeff49a63 => 99
	i32 4046471985, ; 235: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 47
	i32 4073602200, ; 236: System.Threading.dll => 0xf2ce3c98 => 115
	i32 4091086043, ; 237: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 238: Microsoft.Maui.Essentials.dll => 0xf40add04 => 49
	i32 4100113165, ; 239: System.Private.Uri => 0xf462c30d => 106
	i32 4103439459, ; 240: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 241: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 39
	i32 4150914736, ; 242: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 243: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 70
	i32 4213026141, ; 244: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 93
	i32 4249188766, ; 245: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 246: Microsoft.Maui.Controls.dll => 0xfea12dee => 46
	i32 4292120959 ; 247: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 70
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [248 x i32] [
	i32 0, ; 0
	i32 9, ; 1
	i32 114, ; 2
	i32 33, ; 3
	i32 50, ; 4
	i32 17, ; 5
	i32 109, ; 6
	i32 32, ; 7
	i32 25, ; 8
	i32 60, ; 9
	i32 78, ; 10
	i32 91, ; 11
	i32 30, ; 12
	i32 56, ; 13
	i32 8, ; 14
	i32 67, ; 15
	i32 54, ; 16
	i32 114, ; 17
	i32 99, ; 18
	i32 34, ; 19
	i32 28, ; 20
	i32 88, ; 21
	i32 66, ; 22
	i32 116, ; 23
	i32 118, ; 24
	i32 6, ; 25
	i32 105, ; 26
	i32 44, ; 27
	i32 27, ; 28
	i32 41, ; 29
	i32 35, ; 30
	i32 64, ; 31
	i32 19, ; 32
	i32 85, ; 33
	i32 110, ; 34
	i32 52, ; 35
	i32 103, ; 36
	i32 96, ; 37
	i32 25, ; 38
	i32 43, ; 39
	i32 106, ; 40
	i32 95, ; 41
	i32 10, ; 42
	i32 24, ; 43
	i32 89, ; 44
	i32 21, ; 45
	i32 14, ; 46
	i32 67, ; 47
	i32 23, ; 48
	i32 88, ; 49
	i32 77, ; 50
	i32 40, ; 51
	i32 57, ; 52
	i32 4, ; 53
	i32 97, ; 54
	i32 69, ; 55
	i32 90, ; 56
	i32 82, ; 57
	i32 118, ; 58
	i32 26, ; 59
	i32 20, ; 60
	i32 16, ; 61
	i32 22, ; 62
	i32 74, ; 63
	i32 2, ; 64
	i32 53, ; 65
	i32 65, ; 66
	i32 11, ; 67
	i32 98, ; 68
	i32 31, ; 69
	i32 32, ; 70
	i32 77, ; 71
	i32 61, ; 72
	i32 0, ; 73
	i32 6, ; 74
	i32 86, ; 75
	i32 96, ; 76
	i32 58, ; 77
	i32 44, ; 78
	i32 86, ; 79
	i32 95, ; 80
	i32 30, ; 81
	i32 113, ; 82
	i32 84, ; 83
	i32 71, ; 84
	i32 80, ; 85
	i32 36, ; 86
	i32 63, ; 87
	i32 100, ; 88
	i32 113, ; 89
	i32 111, ; 90
	i32 81, ; 91
	i32 102, ; 92
	i32 112, ; 93
	i32 54, ; 94
	i32 59, ; 95
	i32 1, ; 96
	i32 94, ; 97
	i32 78, ; 98
	i32 41, ; 99
	i32 122, ; 100
	i32 17, ; 101
	i32 66, ; 102
	i32 9, ; 103
	i32 71, ; 104
	i32 82, ; 105
	i32 81, ; 106
	i32 75, ; 107
	i32 42, ; 108
	i32 26, ; 109
	i32 97, ; 110
	i32 8, ; 111
	i32 2, ; 112
	i32 87, ; 113
	i32 13, ; 114
	i32 37, ; 115
	i32 5, ; 116
	i32 69, ; 117
	i32 107, ; 118
	i32 68, ; 119
	i32 4, ; 120
	i32 94, ; 121
	i32 111, ; 122
	i32 104, ; 123
	i32 55, ; 124
	i32 92, ; 125
	i32 48, ; 126
	i32 12, ; 127
	i32 43, ; 128
	i32 42, ; 129
	i32 105, ; 130
	i32 83, ; 131
	i32 100, ; 132
	i32 14, ; 133
	i32 38, ; 134
	i32 76, ; 135
	i32 101, ; 136
	i32 18, ; 137
	i32 120, ; 138
	i32 108, ; 139
	i32 102, ; 140
	i32 12, ; 141
	i32 117, ; 142
	i32 37, ; 143
	i32 13, ; 144
	i32 116, ; 145
	i32 10, ; 146
	i32 92, ; 147
	i32 52, ; 148
	i32 119, ; 149
	i32 121, ; 150
	i32 46, ; 151
	i32 16, ; 152
	i32 11, ; 153
	i32 15, ; 154
	i32 20, ; 155
	i32 83, ; 156
	i32 107, ; 157
	i32 63, ; 158
	i32 15, ; 159
	i32 110, ; 160
	i32 56, ; 161
	i32 58, ; 162
	i32 1, ; 163
	i32 21, ; 164
	i32 47, ; 165
	i32 48, ; 166
	i32 79, ; 167
	i32 27, ; 168
	i32 50, ; 169
	i32 61, ; 170
	i32 79, ; 171
	i32 49, ; 172
	i32 36, ; 173
	i32 120, ; 174
	i32 80, ; 175
	i32 104, ; 176
	i32 91, ; 177
	i32 65, ; 178
	i32 34, ; 179
	i32 7, ; 180
	i32 72, ; 181
	i32 122, ; 182
	i32 89, ; 183
	i32 73, ; 184
	i32 115, ; 185
	i32 59, ; 186
	i32 51, ; 187
	i32 7, ; 188
	i32 103, ; 189
	i32 64, ; 190
	i32 74, ; 191
	i32 24, ; 192
	i32 53, ; 193
	i32 62, ; 194
	i32 121, ; 195
	i32 76, ; 196
	i32 3, ; 197
	i32 39, ; 198
	i32 119, ; 199
	i32 45, ; 200
	i32 22, ; 201
	i32 90, ; 202
	i32 123, ; 203
	i32 23, ; 204
	i32 31, ; 205
	i32 33, ; 206
	i32 98, ; 207
	i32 108, ; 208
	i32 68, ; 209
	i32 28, ; 210
	i32 73, ; 211
	i32 38, ; 212
	i32 123, ; 213
	i32 84, ; 214
	i32 72, ; 215
	i32 93, ; 216
	i32 3, ; 217
	i32 55, ; 218
	i32 60, ; 219
	i32 87, ; 220
	i32 45, ; 221
	i32 35, ; 222
	i32 112, ; 223
	i32 40, ; 224
	i32 101, ; 225
	i32 109, ; 226
	i32 51, ; 227
	i32 85, ; 228
	i32 62, ; 229
	i32 19, ; 230
	i32 117, ; 231
	i32 75, ; 232
	i32 57, ; 233
	i32 99, ; 234
	i32 47, ; 235
	i32 115, ; 236
	i32 5, ; 237
	i32 49, ; 238
	i32 106, ; 239
	i32 29, ; 240
	i32 39, ; 241
	i32 29, ; 242
	i32 70, ; 243
	i32 93, ; 244
	i32 18, ; 245
	i32 46, ; 246
	i32 70 ; 247
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

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
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

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

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
!7 = !{i32 1, !"min_enum_size", i32 4}
