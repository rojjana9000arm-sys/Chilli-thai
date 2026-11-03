-- ==========================================
-- 🌶️ Chilli Hub V8 - Ultimate Thai Translator
-- แปลไทยโดย : nookky_ 👑
-- Version : 3.0 (Full Dictionary + Zero-Lag + Floating Button)
-- ==========================================

local GuiService = (gethui and gethui()) or game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- ==========================================
-- 1. DICTIONARY (คำศัพท์ทั้งหมด ENG + VN)
-- ==========================================
local dict = {
    -- 🏠 เมนูหลัก / Dashboard
    ["Dashboard"] = "🏠 หน้าแรก",
    ["Welcome back"] = "ยินดีต้อนรับกลับมา",
    ["Venyx Discord"] = "ดิสคอร์ด Venyx",
    ["Updates, keys, support"] = "อัปเดต, คีย์, ช่วยเหลือ",
    ["Copy invite"] = "คัดลอกลิงก์เชิญ",
    ["Rejoin"] = "🔄 เข้าห้องใหม่",
    ["Server hop"] = "🌐 เปลี่ยนเซิร์ฟเวอร์",
    ["Copy Job ID"] = "📋 คัดลอก Job ID",
    ["Unload hub"] = "❌ ปิดสคริปต์",
    ["Chilli Hub"] = "🌶️ Chilli Hub",
    ["SESSION"] = "⏱️ เซสชัน",
    ["CANDY CORN"] = "🍬 ข้าวโพดหวาน",
    ["LAST EGG"] = "🥚 ไข่ล่าสุด",
    ["PLACED"] = "📍 วางแล้ว",
    ["MONEY /s"] = "💰 เงิน/วินาที",
    ["NIGHT IN"] = "🌙 กลางคืนในอีก",
    ["SESSION TIME"] = "⏳ เวลาเล่น",
    ["BEST STEAL"] = "🏆 ขโมยดีที่สุด",
    ["EGG BAG"] = "🥚 กระเป๋าไข่",
    ["PET BAG"] = "🐾 กระเป๋าสัตว์",
    ["OPEN"] = "เปิด",
    ["WHAT'S NEW"] = "✨ มีอะไรใหม่",
    ["Search"] = "🔎 ค้นหา",
    ["UI scale"] = "📏 ขนาด UI",
    ["Show / hide UI"] = "👁️ แสดง/ซ่อน UI",
    ["Opacity"] = "💧 ความโปร่งใส",
    ["Tone"] = "🎨 โทนสี",
    ["Dim the game"] = "🌑 ทำให้เกมมืดลง",
    ["Twilight"] = "🌆 Twilight",
    ["Aurora"] = "🌌 Aurora",
    ["Ocean"] = "🌊 Ocean",
    ["Midnight"] = "🌃 Midnight",

    -- 🥚 Steal (การขโมย)
    ["Steal"] = "🥚 ขโมย",
    ["Auto Steal"] = "⚡ ขโมยอัตโนมัติ",
    ["Egg Predictor"] = "🔮 คาดการณ์ไข่",
    ["Move to egg"] = "🚶 เดินไปที่ไข่",
    ["Delivery method"] = "🚚 วิธีส่งไข่",
    ["Steal missing index eggs"] = "📖 ขโมยไข่ที่ขาดในสารบัญ",
    ["Steal from other players"] = "👥 ขโมยจากผู้เล่นอื่น",
    ["Anti guard"] = "🛡️ ป้องกันการ์ด",
    ["Drop eggs at safe zone"] = "🏃 ทิ้งไข่ในเขตปลอดภัย",
    ["AUTO HOP SERVER"] = "🔄 เปลี่ยนเซิร์ฟเวอร์อัตโนมัติ",
    ["FILTER"] = "🎯 ตัวกรอง",
    ["Zones"] = "🗺️ โซนพื้นที่",
    ["Steal first"] = "🥇 ขโมยลำดับแรก",
    ["Mutations"] = "🧬 การกลายพันธุ์",
    ["Rarities"] = "💎 ระดับความหายาก",
    ["Only these eggs"] = "🥚 เฉพาะไข่เหล่านี้",
    ["Min value /s"] = "💰 มูลค่าขั้นต่ำ /s",
    ["Sell cheapest egg when bag is full"] = "💰 ขายไข่ที่ถูกที่สุดเมื่อกระเป๋าเต็ม",
    ["Only below /s"] = "📉 ต่ำกว่า /s",
    ["EGG SHOWCASE"] = "🖼️ โชว์เคสไข่",
    ["Sort eggs"] = "↕️ เรียงลำดับไข่",
    ["Calculate mutations"] = "🧮 คำนวณการกลายพันธุ์",
    ["Cards show the value with these mutations added"] = "การ์ดจะแสดงมูลค่าเมื่อบวกการกลายพันธุ์เหล่านี้",
    ["Preview card"] = "👁️ ดูตัวอย่างการ์ด",
    ["ALL"] = "ทั้งหมด",
    ["READY"] = "พร้อม",
    ["GROWING"] = "กำลังโต",
    ["IN BAG"] = "ในกระเป๋า",
    ["Value"] = "💰 มูลค่า",
    ["Walk"] = "🚶 เดิน",
    
    -- 🗺️ โซนแผนที่ (Map Zones)
    ["Pick any"] = "📍 เลือกทั้งหมด",
    ["Enchanted Forest"] = "🌳 ป่าต้องสาป",
    ["Light Dark"] = "🌓 สว่าง/มืด",
    ["Titan Temple"] = "🏛️ วิหารไททัน",
    ["Cherry Blossom"] = "🌸 ซากุระ",
    ["Prehistoric"] = "🦖 ยุคก่อนประวัติศาสตร์",
    ["Abyss Ocean"] = "🌊 มหาสมุทรลึก",
    ["Volcano"] = "🌋 ภูเขาไฟ",
    ["Snow"] = "❄️ หิมะ",
    ["Jungle"] = "🌴 ป่าดงดิบ",
    ["Desert"] = "🏜️ ทะเลทราย",
    ["Lake"] = "🏞️ ทะเลสาบ",
    ["Clear"] = "🧹 ล้าง",
    ["Select all"] = "✅ เลือกทั้งหมด",
    ["Cosmic"] = "🌌 คอสมิก",

    -- 👽 กิจกรรม UFO (Event)
    ["Event"] = "🎁 กิจกรรม",
    ["UFO"] = "🛸 UFO",
    ["UFO SIGHTINGS"] = "👽 การพบเห็น UFO",
    ["Auto UFO"] = "👽 UFO อัตโนมัติ",
    ["Collect UFO debris"] = "🛸 เก็บเศษซาก UFO",
    ["Enter rare UFO"] = "🚪 เข้า UFO หายาก",
    ["Auto trade debris"] = "🔄 แลกเศษซากอัตโนมัติ",
    ["UFO move to egg"] = "🚶 UFO เดินไปที่ไข่",
    ["UFO delivery"] = "🚚 UFO ขนส่ง",
    ["UFO STATUS"] = "📋 สถานะ UFO",
    ["Off"] = "ปิด",
    ["DEBRIS"] = "🛸 เศษซาก",
    ["STAR & HOLLOW"] = "⭐ ดาว & โพรง",
    ["The Hollow"] = "🕳️ The Hollow",
    ["Shooting Star"] = "🌠 ดาวตก",

    -- 🇻🇳 ภาษาเวียดนาม (Vietnam Support)
    ["Sự kiện"] = "🎁 กิจกรรม",
    ["sao băng & Vực Hollow"] = "⭐ ดาวตก & The Hollow",
    ["Bắt Bướm"] = "🦋 จับผีเสื้อ",
    ["PHÁT HIỆN UFO"] = "👽 การพบเห็น UFO",
    ["Tự động UFO"] = "👽 UFO อัตโนมัติ",
    ["nhặt UFO debris"] = "🛸 เก็บเศษซาก UFO",
    ["Enter Hiếm UFO"] = "🚪 เข้า UFO หายาก",
    ["Tự động trao đổi debris"] = "🔄 แลกเศษซากอัตโนมัติ",
    ["UFO TRẠNG THÁI"] = "📋 สถานะ UFO",
    ["TRỨNG (EGGS)"] = "🥚 ไข่",
    ["Đột biến"] = "🧬 การกลายพันธุ์",
    ["TRẠNG THÁI"] = "📋 สถานะ",
    ["THẮNG"] = "🏆 ชนะ",
    ["TỐI ƯU: BẬT"] = "🚀 ปรับแต่ง: เปิด",
    ["Tìm kiếm"] = "🔎 ค้นหา",
    ["Đang rảnh"] = "🟢 ว่าง/พร้อมใช้งาน",
    ["Dịch chuyển if far tứ trúng"] = "⚡ วาร์ปไปหาไข่ทันที",
    ["SAO BĂNG & VỰC HOLLOW"] = "⭐ ดาวตก & The Hollow",
    ["Vực Hollow"] = "🕳️ The Hollow",
    ["SAO BĂNG RƠI"] = "🌠 ดาวตก",
    ["ĐÃ BẮT"] = "✅ จับได้แล้ว",
    ["Waiting for a star"] = "⏳ กำลังรอดาวตก",

    -- 🎁 Event อื่นๆ (Halloween, Butterfly, AA)
    ["Halloween & Star"] = "🎃 ฮาโลวีน & ดาว",
    ["Butterfly"] = "🦋 ผีเสื้อ",
    ["AA"] = "👑 AA (แอดมิน)",
    ["HALLOWEEN DIMENSION"] = "🎃 มิติฮาโลวีน",
    ["Auto steal Halloween eggs"] = "⚡ ขโมยไข่ฮาโลวีนอัตโนมัติ",
    ["Instant steal Halloween eggs"] = "⚡ ขโมยไข่ฮาโลวีนทันที",
    ["Steal missing Halloween index"] = "📖 ขโมยไข่ฮาโลวีนที่ขาด",
    ["Place and hatch missing index eggs"] = "🥚 วางและฟักไข่ที่ขาด",
    ["Halloween eggs"] = "🥚 ไข่ฮาโลวีน",
    ["Halloween rarities"] = "💎 ระดับฮาโลวีน",
    ["PUMPKIN BOSS"] = "🎃 บอสฟักทอง",
    ["Auto Pumpkin boss"] = "⚔️ สู้บอสฟักทองอัตโนมัติ",
    ["Auto dodge attacks"] = "🛡️ หลบการโจมตีอัตโนมัติ",
    ["Use weapons"] = "🗡️ ใช้อาวุธ",
    ["Auto claim mastery"] = "🏆 รับรางวัลความชำนาญอัตโนมัติ",
    ["Stubs pickup speed"] = "💨 ความเร็วในการเก็บ Stubs",
    ["Auto manor key"] = "🗝️ กุญแจคฤหาสน์อัตโนมัติ",
    ["STATUS"] = "📋 สถานะ",
    ["KILLS"] = "💀 ฆ่าได้",
    ["MANOR KEY"] = "🗝️ กุญแจคฤหาสน์",
    ["GHOST DOG AND FISHING"] = "👻 หมาผีและการตกปลา",
    ["Auto race The Hollow"] = "🏃 แข่งรถ The Hollow อัตโนมัติ",
    ["Race speed"] = "💨 ความเร็วในการแข่ง",
    ["Use power-ups"] = "⚡ ใช้ไอเท็มเพิ่มพลัง",
    ["WINS"] = "🏆 ชนะ",
    ["BUTTERFLY BLOOM"] = "🌸 ดอกไม้ผีเสื้อ",
    ["Auto butterfly bloom"] = "🌸 เก็บผีเสื้ออัตโนมัติ",
    ["EMERALD"] = "🟢 มรกต",
    ["SAPPHIRE"] = "🔵 ไพลิน",
    ["AMETHYST"] = "🟣 อเมทิสต์",
    ["RADIANT"] = "🟡 เรืองแสง",
    ["ESSENCE"] = "✨ เอสเซนส์",
    ["CAUGHT"] = "🦋 จับได้",
    ["Catch mode"] = "🎯 โหมดการจับ",
    ["Catch priority"] = "🥇 ลำดับความสำคัญในการจับ",
    ["BUTTERFLY MACHINE"] = "⚙️ เครื่องผีเสื้อ",
    ["Auto trade up"] = "🔄 แลกเปลี่ยนอัตโนมัติ",
    ["Trade"] = "🤝 แลกเปลี่ยน",
    ["Smart trade for essence"] = "🧠 แลกเปลี่ยนอย่างชาญฉลาดเพื่อเอสเซนส์",
    ["Auto craft essence"] = "✨ คราฟต์เอสเซนส์อัตโนมัติ",
    ["WISP COMPANION"] = "👻 เพื่อน Wisp",
    ["Auto wisp quest"] = "📜 ทำเควส Wisp อัตโนมัติ",
    ["Auto banjo cricket"] = "🦗 จับ Banjo Cricket อัตโนมัติ",
    ["ADMIN ABUSE"] = "👑 แอดมิน",
    ["Instant steal"] = "⚡ ขโมยทันที",
    ["Admin treadmill"] = "🏃 ลู่วิ่งแอดมิน",
    ["CURSED ISLAND WARS"] = "⚔️ สงครามเกาะต้องสาป",
    ["Auto play Cursed Island Wars"] = "⚔️ เล่นสงครามเกาะอัตโนมัติ",
    ["Island Wars target"] = "🎯 เป้าหมายสงครามเกาะ",
    ["CAPTURE THE EGG"] = "🚩 ยึดไข่",
    ["Auto capture event egg"] = "🚩 ยึดไข่กิจกรรมอัตโนมัติ",
    ["Take it from the holder"] = "🤲 แย่งจากคนถือ",
    ["Hold height"] = "📏 ความสูงในการถือ",
    ["Keep away"] = "🏃 ระยะห่าง",
    ["MINIGAME EGGS"] = "🎮 มินิเกมไข่",

    -- 🏃 Farm (ฟาร์ม)
    ["Farm"] = "🏃 ฟาร์ม",
    ["Pen"] = "🏠 คอกสัตว์",
    ["Treadmill"] = "🏃 ลู่วิ่ง",
    ["Mutate"] = "🧬 กลายพันธุ์",
    ["Sell"] = "💰 ขาย",
    ["Fuse"] = "🔧 ผสม",
    ["Priority"] = "🎯 ลำดับความสำคัญ",
    ["AUTO PLACE"] = "📍 วางอัตโนมัติ",
    ["Auto place"] = "📍 วางอัตโนมัติ",
    ["Place when"] = "⏱️ วางเมื่อ",
    ["Place first"] = "🥇 วางลำดับแรก",
    ["AUTO HATCH"] = "🐣 ฟักอัตโนมัติ",
    ["Auto hatch"] = "🐣 ฟักอัตโนมัติ",
    ["Equip best pets"] = "🐾 สวมสัตว์เลี้ยงที่ดีที่สุด",
    ["READY NOW"] = "⏳ พร้อมแล้ว",
    ["HATCHED"] = "🐣 ฟักแล้ว",
    ["Max value /s"] = "💰 มูลค่าสูงสุด /s",
    ["TREADMILL"] = "🏃 ลู่วิ่ง",
    ["Auto treadmill"] = "🏃 ลู่วิ่งอัตโนมัติ",
    ["Auto upgrade treadmill"] = "⬆️ อัปเกรดลู่วิ่งอัตโนมัติ",
    ["PROGRESS"] = "📈 ความคืบหน้า",
    ["Auto upgrade base"] = "⬆️ อัปเกรดฐานอัตโนมัติ",
    ["Auto buy trails"] = "🛒 ซื้อเส้นทางอัตโนมัติ",
    ["Auto claim offline cash"] = "💰 รับเงินออฟไลน์อัตโนมัติ",
    ["Auto claim index rewards"] = "🏆 รับรางวัลสารบัญอัตโนมัติ",
    ["AUTO MUTATE"] = "🧬 กลายพันธุ์อัตโนมัติ",
    ["Every egg that fits already has these mutations"] = "ทุกไข่ที่เข้าเกณฑ์มีการกลายพันธุ์เหล่านี้แล้ว",
    ["Auto mutate"] = "🧬 กลายพันธุ์อัตโนมัติ",
    ["Use items"] = "🎒 ใช้ไอเท็ม",
    ["Mutate first"] = "🥇 กลายพันธุ์ลำดับแรก",
    ["MUTATE A CHOSEN EGG"] = "🥚 กลายพันธุ์ไข่ที่เลือก",
    ["Mutations to add"] = "🧬 การกลายพันธุ์ที่จะเพิ่ม",
    ["MUTATE FILTER"] = "🎯 ตัวกรองการกลายพันธุ์",
    ["Skip eggs with"] = "⏭️ ข้ามไข่ที่มี",
    ["FRACTURED"] = "💎 แตกสลาย",
    ["SCRAMBLED"] = "🧪 สับสน",
    ["ENCHANTED"] = "✨ ร่ายมนตร์",
    ["NITRO"] = "🔥 ไนโตร",
    ["SPECTRAL"] = "👻 วิญญาณ",
    ["PETS"] = "🐾 สัตว์เลี้ยง",
    ["EGGS"] = "🥚 ไข่",
    ["Auto sell pets"] = "💰 ขายสัตว์เลี้ยงอัตโนมัติ",
    ["Auto sell eggs"] = "💰 ขายไข่อัตโนมัติ",
    ["Sell rarities"] = "💎 ขายตามระดับ",
    ["Never sell"] = "🚫 ห้ามขาย",
    ["Only mutations"] = "🧬 เฉพาะที่กลายพันธุ์",
    ["Keep mutated"] = "🧬 เก็บที่กลายพันธุ์ไว้",
    ["Sell matching pets now"] = "💰 ขายสัตว์เลี้ยงที่เข้าเกณฑ์ตอนนี้",
    ["Sell matching eggs now"] = "💰 ขายไข่ที่เข้าเกณฑ์ตอนนี้",
    ["FUSE MACHINE"] = "🔧 เครื่องผสม",
    ["No 3 matching pets"] = "ไม่มีสัตว์เลี้ยง 3 ตัวที่เหมือนกัน",
    ["Auto fuse"] = "🔧 ผสมอัตโนมัติ",
    ["Fuse first"] = "🥇 ผสมลำดับแรก",
    ["Use pets"] = "🐾 ใช้สัตว์เลี้ยง",
    ["Skip mutated"] = "⏭️ ข้ามที่กลายพันธุ์",
    ["Eject odd pets"] = "⏏️ นำสัตว์เลี้ยงที่เกินออก",
    ["FUSE FILTER"] = "🎯 ตัวกรองการผสม",
    ["Only these pets"] = "🐾 เฉพาะสัตว์เลี้ยงเหล่านี้",
    ["Never fuse"] = "🚫 ห้ามผสม",
    ["FUSE PREDICTOR"] = "🔮 คาดการณ์การผสม",
    ["TASK ORDER"] = "📋 ลำดับงาน",
    ["DOING NOW"] = "⚡ กำลังทำ",
    ["NEXT 1"] = "⏭️ ถัดไป 1",
    ["NEXT 2"] = "⏭️ ถัดไป 2",
    ["NEXT 3"] = "⏭️ ถัดไป 3",
    ["Steal filter eggs"] = "🥚 ขโมยไข่ตามตัวกรอง",
    ["Phantom Express"] = "🚂 รถไฟผี",
    ["PRIORITY ROTATION"] = "🔄 หมุนเวียนลำดับความสำคัญ",
    ["NOW"] = "📍 ตอนนี้",
    ["SWITCH IN"] = "⏱️ สลับในอีก",
    ["Rotate fishing and treadmill"] = "🔄 สลับการตกปลาและลู่วิ่ง",
    ["Switch"] = "🔄 สลับ",
    ["Fishing minutes"] = "⏱️ นาทีตกปลา",
    ["Treadmill minutes"] = "⏱️ นาทีลู่วิ่ง",

    -- 👤 Player (ผู้เล่น)
    ["Player"] = "👤 ผู้เล่น",
    ["ESP"] = "👁️ ESP (มองทะลุ)",
    ["Move"] = "🏃 การเคลื่อนที่",
    ["Combat"] = "⚔️ การต่อสู้",
    ["FIELD EGGS"] = "🥚 ไข่ในสนาม",
    ["OTHERS"] = "📦 อื่นๆ",
    ["Egg ESP"] = "👁️ ESP ไข่",
    ["Show"] = "📋 แสดง",
    ["Fixed size"] = "📏 ขนาดคงที่",
    ["Pen egg ESP"] = "👁️ ESP ไข่ในคอก",
    ["Other pens ESP"] = "👁️ ESP คอกอื่น",
    ["Guard ESP"] = "👁️ ESP ยาม",
    ["Hide sleeping guards"] = "💤 ซ่อนยามที่หลับ",
    ["Player ESP"] = "👁️ ESP ผู้เล่น",
    ["Inventory values"] = "💰 มูลค่าในกระเป๋า",
    ["ESP size"] = "📏 ขนาด ESP",
    ["MOVEMENT"] = "🏃 การเคลื่อนที่",
    ["Speed boost"] = "💨 เพิ่มความเร็ว",
    ["Boost speed"] = "💨 ค่าความเร็ว",
    ["Infinite jump"] = "🦘 กระโดดไม่จำกัด",
    ["God mode"] = "🛡️ โหมดพระเจ้า",
    ["PROTECTION"] = "🛡️ การป้องกัน",
    ["Anti ragdoll"] = "🛡️ กันล้ม",
    ["Ignore traps"] = "🛡️ หลบกับดัก",
    ["Instant prompts"] = "⚡ โต้ตอบทันที",
    ["Anti AFK"] = "💤 กันหลุด",
    ["Invisible"] = "👻 ล่องหน",
    ["AUTO HIT"] = "⚔️ ตีอัตโนมัติ",
    ["Auto hit"] = "⚔️ ตีอัตโนมัติ",
    ["Hit who"] = "🎯 ตีใคร",
    ["Chosen player"] = "👤 ผู้เล่นที่เลือก",
    ["Chase speed"] = "💨 ความเร็วในการไล่",
    ["HIT AURA"] = "⭕ ออร่าตี",
    ["Hit aura"] = "⭕ ออร่าตี",
    ["Skip friends"] = "⏭️ ข้ามเพื่อน",
    ["WEAPONS"] = "🗡️ อาวุธ",
    ["Use weapons"] = "🗡️ ใช้อาวุธ",
    ["Hold each"] = "⏱️ ถือแต่ละครั้ง",

    -- ⚙️ System (ระบบ)
    ["System"] = "⚙️ ระบบ",
    ["Server"] = "🌐 เซิร์ฟเวอร์",
    ["Webhook"] = "🔗 เว็บฮุค",
    ["Optimizer"] = "🚀 ปรับแต่งประสิทธิภาพ",
    ["Interface"] = "🎨 อินเทอร์เฟซ",
    ["Config"] = "📁 การตั้งค่า",
    ["Hop to"] = "🌐 ไปที่",
    ["Hop server"] = "🌐 เปลี่ยนเซิร์ฟเวอร์",
    ["Rejoin this server"] = "🔄 กลับเข้าเซิร์ฟเวอร์นี้",
    ["JOIN AND STAY"] = "🔗 เข้าร่วมและอยู่ต่อ",
    ["Job ID"] = "🆔 Job ID",
    ["Join that server"] = "🔗 เข้าร่วมเซิร์ฟเวอร์นั้น",
    ["Rejoin on kick"] = "🔄 เข้าห้องใหม่เมื่อถูกเตะ",
    ["Auto load script"] = "🚀 โหลดสคริปต์อัตโนมัติ",
    ["DISCORD WEBHOOK"] = "🔗 ดิสคอร์ดเว็บฮุค",
    ["Webhook URL"] = "🔗 URL เว็บฮุค",
    ["Ping everyone"] = "📢 แท็กทุกคน",
    ["Ping user ID"] = "🆔 แท็ก ID ผู้ใช้",
    ["Ping role ID"] = "🏷️ แท็ก ID ยศ",
    ["POSTED"] = "📤 โพสต์แล้ว",
    ["WAITING"] = "⏳ กำลังรอ",
    ["Send a test post"] = "📤 ส่งข้อความทดสอบ",
    ["Test"] = "ทดสอบ",
    ["WHAT TO POST"] = "📝 สิ่งที่จะโพสต์",
    ["Post stolen eggs"] = "🥚 โพสต์ไข่ที่ขโมยได้",
    ["Post fused eggs"] = "🔧 โพสต์ไข่ที่ผสมแล้ว",
    ["Post when bag is full"] = "🎒 โพสต์เมื่อกระเป๋าเต็ม",
    ["GRAPHICS"] = "🖼️ กราฟิก",
    ["Low graphics"] = "📉 กราฟิกต่ำ",
    ["Optimizer mode"] = "🚀 โหมดปรับแต่ง",
    ["Disable 3D Render"] = "🚫 ปิดการเรนเดอร์ 3D",
    ["Background color"] = "🎨 สีพื้นหลัง",
    ["Hide game UI"] = "👁️ ซ่อน UI เกม",
    ["FRAME RATE"] = "📺 อัตราเฟรม",
    ["FPS cap"] = "🎯 จำกัด FPS",
    ["BASES"] = "🏠 ฐาน",
    ["Hide other players' pets and eggs"] = "👁️ ซ่อนสัตว์เลี้ยงและไข่ของผู้เล่นอื่น",
    ["Hide my pets and eggs"] = "👁️ ซ่อนสัตว์เลี้ยงและไข่ของฉัน",
    ["INTERFACE"] = "🎨 อินเทอร์เฟซ",
    ["THEME"] = "🎨 ธีม",
    ["QUICK BARS"] = "⚡ แถบด่วน",
    ["Show quick bars"] = "👁️ แสดงแถบด่วน",
    ["Keybinds"] = "⌨️ ปุ่มลัด",
    ["Bar size"] = "📏 ขนาดแถบ",
    ["PINS AND KEYBINDS"] = "📌 ปักหมุดและปุ่มลัด",
    ["Find an option"] = "🔎 ค้นหาตัวเลือก",
    ["All"] = "ทั้งหมด",
    ["Pinned"] = "📌 ปักหมุด",
    ["CONFIG"] = "📁 การตั้งค่า",
    ["ACTIVE"] = "🟢 ใช้งานอยู่",
    ["SAVED CONFIGS"] = "💾 คอนฟิกที่บันทึกไว้",
    ["Default"] = "ค่าเริ่มต้น",
    ["Set as active config"] = "🟢 ตั้งเป็นคอนฟิกที่ใช้งาน",
    ["Set active"] = "ตั้งค่า",
    ["Save changes"] = "💾 บันทึกการเปลี่ยนแปลง",
    ["Save"] = "บันทึก",
    ["Auto load"] = "🚀 โหลดอัตโนมัติ",
    ["Auto save"] = "💾 บันทึกอัตโนมัติ",
    ["PROFILES"] = "👤 โปรไฟล์",
    ["New config name"] = "📝 ชื่อคอนฟิกใหม่",
    ["Auto if empty"] = "อัตโนมัติถ้าว่างเปล่า",
    ["Create config"] = "➕ สร้างคอนฟิก",
    ["Create"] = "สร้าง",
    ["Pick to delete"] = "🗑️ เลือกเพื่อลบ",
    ["None"] = "ไม่มี",
    ["Delete picked"] = "🗑️ ลบที่เลือก",
    ["Delete"] = "ลบ",
    ["Restore deleted"] = "🔄 กู้คืนที่ถูกลบ",
    ["Export config"] = "📤 ส่งออกคอนฟิก",
    ["Import text"] = "📥 นำเข้าข้อความ",
    ["Paste config text"] = "วางข้อความคอนฟิก",
    ["Import config"] = "📥 นำเข้าคอนฟิก",
    ["Import"] = "นำเข้า",

    -- 💎 Rarities & Mutations (ระดับความหายาก)
    ["Common"] = "⚪ ธรรมดา",
    ["Uncommon"] = "🟢 ไม่ธรรมดา",
    ["Rare"] = "🔵 แรร์",
    ["Epic"] = "🟣 อีปิค",
    ["Legendary"] = "🟠 ตำนาน",
    ["Mythic"] = "🔴 มิธิค",
    ["Secret"] = "🔮 ลับ",
    ["Eternal"] = "♾️ นิรันดร์",
    ["Divine"] = "✨ ศักดิ์สิทธิ์",
    ["GOLDEN"] = "🌟 ทอง",

    -- ==========================================
    -- 🔧 คำที่หลุดมา (ภาษาอังกฤษในรูป)
    -- ==========================================
    ["Teleport"] = "⚡ วาร์ป",
    ["Quick steps"] = "👣 ก้าวด่วน",
    ["Teleport zones"] = "📍 โซนวาร์ป",
    ["Prehistoric..."] = "🦖 ยุคก่อนประวัติศาสตร์...",
    ["Best value"] = "💰 มูลค่าสูงสุด",
    
    -- หน้าติดดาว (Favorite)
    ["FAVORITE"] = "⭐ โปรด",
    ["Auto favorite"] = "❤️ ติดดาวอัตโนมัติ",
    ["Match"] = "🎯 เงื่อนไข",
    ["All picked rules"] = "✅ ตรงตามกฎที่เลือกทั้งหมด",
    ["Always favorite"] = "🌟 ติดดาวเสมอ",
    ["Favorite equipped"] = "✨ ติดดาวที่ใส่อยู่",
    ["Unfavorite pets not matching"] = "💔 ยกเลิกติดดาวสัตว์ที่ไม่ตรงเงื่อนไข",

    -- ==========================================
    -- 🇻🇳 ภาษาเวียดนาม (Vietnam - v1.5.0)
    -- ==========================================
    
    -- 🏠 เมนูหลัก / ระบบ
    ["Đang rảnh"] = "🟢 ว่าง/พร้อมใช้งาน",
    ["TỐI ƯU: BẬT"] = "🚀 ปรับแต่ง: เปิด",
    ["Tìm kiếm"] = "🔎 ค้นหา",
    ["Sự kiện"] = "🎁 กิจกรรม",
    ["Cuộp Trứng"] = "🥚 ขโมยไข่",
    ["Thú nuôi"] = "🐾 สัตว์เลี้ยง",
    ["Cài đặt"] = "⚙️ ตั้งค่า",
    ["Nhà"] = "🏠 หน้าแรก",
    ["Mục tiêu"] = "🎯 เป้าหมาย",
    
    -- 🥚 หน้าไข่ (Egg Showcase)
    ["TRƯNG BÀY TRỨNG"] = "🖼️ โชว์เคสไข่",
    ["Sắp xếp trứng"] = "↕️ เรียงลำดับไข่",
    ["Giá trị"] = "💰 มูลค่า",
    ["Tính thủ đột biến"] = "🧮 คำนวณการกลายพันธุ์",
    ["Thẻ trứng sẽ hiển thị giá trị sau khi cộng thêm các đột biến này"] = "การ์ดจะแสดงมูลค่าเมื่อบวกการกลายพันธุ์เหล่านี้",
    ["Thẻ xem trước"] = "👁️ ดูตัวอย่างการ์ด",
    ["Tổng số"] = "📦 รวมทั้งหมด",
    ["sẵn sàng"] = "พร้อม",
    ["đang lớn"] = "กำลังโต",
    ["trong túi"] = "ในกระเป๋า",

    -- 🥚 หน้าขโมย (Auto Steal)
    ["TỰ ĐỘNG CƯỚP"] = "⚡ ขโมยอัตโนมัติ",
    ["Tự động cướp"] = "⚡ ขโมยอัตโนมัติ",
    ["Di Chuyển tới trứng"] = "🚶 เดินไปที่ไข่",
    ["Dịch chuyển"] = "⚡ วาร์ป",
    ["Cách mang về"] = "🚚 วิธีส่งไข่",
    ["Khu vực dịch chuyển"] = "📍 โซนวาร์ป",
    ["Cướp trứng thiếu trong Chỉ mục"] = "📖 ขโมยไข่ที่ขาดในสารบัญ",
    ["Cướp từ người chơi khác"] = "👥 ขโมยจากผู้เล่นอื่น",
    ["Chống vệ sĩ"] = "🛡️ ป้องกันการ์ด",
    ["Thả trứng ở vùng an toàn"] = "🏃 ทิ้งไข่ในเขตปลอดภัย",
    ["BỘ LỌC"] = "🎯 ตัวกรอง",
    ["Khu vực"] = "🗺️ โซนพื้นที่",
    ["Ưu tiên cướp"] = "🥇 ลำดับความสำคัญในการขโมย",
    ["Giá trị cao nhất"] = "💰 มูลค่าสูงสุด",
    ["Đột biến"] = "🧬 การกลายพันธุ์",
    ["Không có"] = "ไม่มี",
    ["Độ hiếm"] = "💎 ระดับความหายาก",
    ["Chỉ những trứng này"] = "🥚 เฉพาะไข่เหล่านี้",
    ["GIÁ TỐI THIỂU /s"] = "💰 มูลค่าขั้นต่ำ /s",
    ["Bán trứng rẻ nhất khi đầy túi"] = "💰 ขายไข่ที่ถูกที่สุดเมื่อกระเป๋าเต็ม",
    ["Chỉ dưới mức /s"] = "📉 ต่ำกว่า /s",
    ["TỰ ĐỘNG CƯỚP (แท็บ)"] = "⚡ ขโมยอัตโนมัติ",
    ["Dự Đoán Trứng"] = "🔮 คาดการณ์ไข่",

    -- 🏃 หน้าฟาร์ม (Farm - Pen)
    ["Chuồng Ấp"] = "🏠 คอกสัตว์",
    ["TỰ ĐỘNG ĐẶT TRỨNG"] = "📍 วางอัตโนมัติ",
    ["Chuồng 2/30 - 0 trứng sẵn sàng đặt"] = "คอก 2/30 - ไข่พร้อมวาง 0 ฟอง",
    ["Tự động đặt trứng"] = "📍 วางอัตโนมัติ",
    ["Đặt trứng vào chuồng và ấp thiếu trong Chỉ mục trứng"] = "วางและฟักไข่ที่ขาดในสารบัญ",
    ["Đặt khi"] = "⏱️ วางเมื่อ",
    ["Luôn luôn"] = "ตลอดเวลา",
    ["Ưu tiên đặt"] = "🥇 ลำดับความสำคัญในการวาง",
    ["TỰ ĐỘNG ẤP TRỨNG"] = "🐣 ฟักอัตโนมัติ",
    ["Tự động ấp trứng"] = "🐣 ฟักอัตโนมัติ",
    ["Trang bị pet mạnh nhất"] = "🐾 สวมสัตว์เลี้ยงที่ดีที่สุด",
    ["SẴN SÀNG ẤP"] = "⏳ พร้อมฟัก",
    ["ĐÃ ẤP"] = "🐣 ฟักแล้ว",
    ["Thánh Thần"] = "✨ ศักดิ์สิทธิ์ (Divine)",
    ["Giá trị tối đa /s"] = "💰 มูลค่าสูงสุด /s",
    ["GIỮ LẠI TRỨNG"] = "🧬 เก็บไข่ไว้",
    
    -- 🏃 หน้าฟาร์ม (Farm - Treadmill)
    ["Máy Tập"] = "🏃 ลู่วิ่ง",
    ["MÁY TẬP CHẠY"] = "🏃 ลู่วิ่ง",
    ["Tự chạy máy tập"] = "🏃 ลู่วิ่งอัตโนมัติ",
    ["Tự nâng cấp máy tập"] = "⬆️ อัปเกรดลู่วิ่งอัตโนมัติ",
    ["TỐC ĐỘ POWER"] = "💨 ความเร็ว",
    ["TIẾN TRÌNH"] = "📈 ความคืบหน้า",
    ["Tự nâng cấp căn cứ"] = "⬆️ อัปเกรดฐานอัตโนมัติ",
    ["Tự mua vệt sáng"] = "🛒 ซื้อเส้นทางอัตโนมัติ",
    ["Tự nhận tiền ngoại tuyến"] = "💰 รับเงินออฟไลน์อัตโนมัติ",
    ["Tự nhận thưởng Chỉ mục"] = "🏆 รับรางวัลสารบัญอัตโนมัติ",

    -- 🏃 หน้าฟาร์ม (Farm - Mutate)
    ["Đột Biến"] = "🧬 กลายพันธุ์",
    ["TỰ ĐỘNG ĐỘT BIẾN"] = "🧬 กลายพันธุ์อัตโนมัติ",
    ["2 trứng có thể đột biến"] = "มีไข่ 2 ฟองที่สามารถกลายพันธุ์ได้",
    ["Tự động đột biến"] = "🧬 กลายพันธุ์อัตโนมัติ",
    ["Dùng vật phẩm"] = "🎒 ใช้ไอเท็ม",
    ["Rạn Nứt"] = "💎 แตกสลาย (Fractured)",
    ["Ưu tiên đột biến"] = "🥇 ลำดับความสำคัญในการกลายพันธุ์",
    ["BỘ LỌC ĐỘT BIẾN"] = "🎯 ตัวกรองการกลายพันธุ์",
    ["Bỏ qua trứng đã có"] = "⏭️ ข้ามไข่ที่มี",
    ["HỖN LOẠN"] = "🧪 สับสน (Scrambled)",
    ["PHÙ PHÉP"] = "✨ ร่ายมนตร์ (Enchanted)",
    ["NITƠ"] = "🔥 ไนโตร (Nitro)",
    ["TỰ ĐỘNG ĐỘT BIẾN CHOSEN TRỨNG"] = "🥚 กลายพันธุ์ไข่ที่เลือก",
    ["đột biến tôi add"] = "🧬 การกลายพันธุ์ที่จะเพิ่ม",
    ["Bị đóng băng"] = "🧊 ถูกแช่แข็ง",
    ["ABDUCTED"] = "👽 ถูกลักพาตัว",
    ["Gorillastein"] = "🦍 กอริลลาสไตน์",
    ["Gorilla King"] = "🦍 คิงกอริลล่า",

    -- 🏃 หน้าฟาร์ม (Farm - Sell)
    ["Bán"] = "💰 ขาย",
    ["THÚ CƯNG (PETS)"] = "🐾 สัตว์เลี้ยง",
    ["Tự động bán pet"] = "💰 ขายสัตว์เลี้ยงอัตโนมัติ",
    ["Độ hiếm bán"] = "💎 ขายตามระดับ",
    ["Hiếm"] = "🔵 แรร์ (Rare)",
    ["Không bao giờ bán"] = "🚫 ห้ามขาย",
    ["Chỉ bán đột biến"] = "🧬 เฉพาะที่กลายพันธุ์",
    ["Chỉ dưới mức /s"] = "📉 ต่ำกว่า /s",
    ["Giữ lại đột biến"] = "🧬 เก็บที่กลายพันธุ์ไว้",
    ["Bán khớp pet ngay"] = "💰 ขายสัตว์เลี้ยงที่เข้าเกณฑ์ตอนนี้",
    ["Tự động bán trứng"] = "💰 ขายไข่อัตโนมัติ",
    ["Bán khớp trứng ngay"] = "💰 ขายไข่ที่เข้าเกณฑ์ตอนนี้",

    -- 🏃 หน้าฟาร์ม (Farm - Fuse)
    ["Dung Hợp"] = "🔧 ผสม (Fuse)",
    ["MÁY DUNG HỢP"] = "🔧 เครื่องผสม",
    ["Không có 3 vật phẩm"] = "ไม่มีสัตว์เลี้ยง 3 ตัวที่เหมือนกัน",
    ["Tự động dung hợp"] = "🔧 ผสมอัตโนมัติ",
    ["Ưu tiên dung hợp"] = "🥇 ลำดับความสำคัญในการผสม",
    ["Độ hiếm thấp nhất"] = "💎 หายากน้อยสุดก่อน",
    ["Sử dụng pet"] = "🐾 ใช้สัตว์เลี้ยง",
    ["Giá trị thấp nhất trước"] = "💰 มูลค่าต่ำสุดก่อน",
    ["Bỏ qua pet đột biến"] = "⏭️ ข้ามที่กลายพันธุ์",
    ["Đẩy pet lẻ ra ngoài"] = "⏏️ นำสัตว์เลี้ยงที่เกินออก",
    ["BỘ LỌC DUNG HỢP"] = "🎯 ตัวกรองการผสม",
    ["Chỉ những pet này"] = "🐾 เฉพาะสัตว์เลี้ยงเหล่านี้",
    ["DỰ ĐOÁN DUNG HỢP"] = "🔮 คาดการณ์การผสม",

    -- 🏃 หน้าฟาร์ม (Farm - Priority)
    ["Ưu Tiên"] = "🎯 ลำดับความสำคัญ",
    ["THỨ TỰ ƯU TIÊN"] = "📋 ลำดับความสำคัญ",
    ["THỨ TỰ TÁC VỤ"] = "📋 ลำดับงาน",
    ["ĐANG LÀM NGAY"] = "⚡ กำลังทำ",
    ["Idle"] = "ว่าง",
    ["TIẾP THEO 1"] = "⏭️ ถัดไป 1",
    ["Nothing"] = "ไม่มี",
    ["TIẾP THEO 2"] = "⏭️ ถัดไป 2",
    ["TIẾP THEO 3"] = "⏭️ ถัดไป 3",
    ["Cướp trứng theo bộ lọc"] = "🥚 ขโมยไข่ตามตัวกรอง",
    ["Bắt Sao Băng"] = "🌠 จับดาวตก",
    ["Vực Hollow đua xe"] = "🚗 แข่งรถ The Hollow",
    ["Săn lùng UFO"] = "🛸 ล่า UFO",
    ["MÙA BƯỚM NỞ"] = "🦋 ฤดูผีเสื้อ",

    -- 🎁 หน้ากิจกรรม (Event)
    ["sao băng & Vực Hollow"] = "⭐ ดาวตก & The Hollow",
    ["Bắt Bướm"] = "🦋 จับผีเสื้อ",
    ["Admin (AA)"] = "👑 แอดมิน (AA)",
    ["Vực Hollow"] = "🕳️ The Hollow",
    ["TRẠNG THÁI"] = "📋 สถานะ",
    ["THẮNG"] = "🏆 ชนะ",
    ["Tự động đua xe Vực Hollow"] = "🚗 แข่งรถ The Hollow อัตโนมัติ",
    ["Tốc độ đua"] = "💨 ความเร็วในการแข่ง",
    ["Tự dùng vật phẩm tăng tốc"] = "⚡ ใช้ไอเท็มเพิ่มพลัง",
    ["SAO BĂNG RƠI"] = "🌠 ดาวตก",
    ["ĐÃ BẮT"] = "✅ จับได้แล้ว",
    ["Tự động bắt sao băng"] = "🌠 จับดาวตกอัตโนมัติ",
    ["MÙA BƯỚM NỞ"] = "🦋 ฤดูผีเสื้อ",
    ["Tắt"] = "ปิด",
    ["Tự động bắt bướm"] = "🦋 จับผีเสื้ออัตโนมัติ",
    ["MÁY ĐỔI BƯỚM"] = "⚙️ เครื่องแลกผีเสื้อ",
    ["Tự nâng cấp bậc bướm"] = "⬆️ อัปเกรดระดับผีเสื้ออัตโนมัติ",
    ["Giao dịch đổi"] = "🤝 แลกเปลี่ยน",
    ["LỤC BẢO"] = "🟢 มรกต (Emerald)",
    ["LAM NGỌC"] = "🔵 ไพลิน (Sapphire)",
    ["THẠCH ANH TÍM"] = "🟣 อเมทิสต์ (Amethyst)",
    ["RỰC RỠ"] = "🟡 เรืองแสง (Radiant)",
    ["TINH CHẤT"] = "✨ เอสเซนส์ (Essence)",
    ["ĐÃ BẮT"] = "✅ จับได้แล้ว",
    ["Chế độ bắt"] = "🎯 โหมดการจับ",
    ["Đuổi theo"] = "🏃 วิ่งตาม",
    ["Ưu tiên bắt"] = "🥇 ลำดับความสำคัญในการจับ",
    ["Hiếm nhất"] = "💎 หายากที่สุด",
    ["Loại bướm bắt"] = "🦋 ประเภทผีเสื้อที่จับ",
    ["Tốc độ bắt"] = "💨 ความเร็วในการจับ",
    ["Đổi bướm lấy tinh chất thông minh"] = "🧠 แลกผีเสื้อเพื่อเอสเซนส์อย่างชาญฉลาด",
    ["Tự chế tạo tinh chất"] = "✨ คราฟต์เอสเซนส์อัตโนมัติ",
    ["ĐỒNG HÀNH WISP"] = "👻 เพื่อน Wisp",
    ["Đã xong, Phù Phép Tree is mở"] = "เสร็จแล้ว, ต้นไม้ต้องสาปเปิดอยู่",
    ["Tự làm nhiệm vụ Wisp"] = "📜 ทำเควส Wisp อัตโนมัติ",
    ["Tự bắt dế Banjo"] = "🦗 จับ Banjo Cricket อัตโนมัติ",
    ["GIAI ĐOẠN"] = "🏁 ช่วงเวลา",
    ["TIẾN TRÌNH"] = "📈 ความคืบหน้า",
    ["Complete"] = "เสร็จสมบูรณ์",
    ["LẠM DỤNG ADMIN (ABUSE)"] = "👑 แอดมิน",
    ["No admin boost right now"] = "ไม่มีบูสต์แอดมินในขณะนี้",
    ["Cướp tức thì"] = "⚡ ขโมยทันที",
    ["Máy tập Admin"] = "🏃 ลู่วิ่งแอดมิน",
    ["ĐẠI CHIẾN ĐẢO NGUYÊN RỪA"] = "⚔️ สงครามเกาะต้องสาป",
    ["Waiting for Cursed Island Wars"] = "กำลังรอสงครามเกาะต้องสาป",
    ["Tự động chơi Đại Chiến Đảo Nguyễn Rùa"] = "⚔️ เล่นสงครามเกาะอัตโนมัติ",
    ["Mục tiêu Đảo Nguyễn Rùa"] = "🎯 เป้าหมายเกาะ",
    ["Kẻ địch và Căn cứ"] = "⚔️ ศัตรูและฐาน",
    ["CƯỚP TRỨNG SỰ KIỆN"] = "🚩 ยึดไข่กิจกรรม",
    ["Đang chờ Cướp trứng sự kiện"] = "กำลังรอการยึดไข่กิจกรรม",
    ["Tự bắt trứng sự kiện"] = "🚩 ยึดไข่กิจกรรมอัตโนมัติ",
    ["Giật trứng từ người đang cầm"] = "🤲 แย่งไข่จากคนถือ",
    ["Độ cao giữ trứng"] = "📏 ความสูงในการถือไข่",
    ["Khoảng cách né tránh"] = "🏃 ระยะห่างในการหลบ",
    ["TRỨNG MINIGAME"] = "🎮 มินิเกมไข่",
    ["Đang chờ Red Light Green Light hoặc T-Rex Run"] = "กำลังรอ Red Light Green Light หรือ T-Rex Run",
    ["Tự cướp trứng Minigame"] = "🎮 ยึดไข่มินิเกมอัตโนมัติ",

    -- 👤 หน้าผู้เล่น (Player - ESP / Move / Combat)
    ["Người chơi"] = "👤 ผู้เล่น",
    ["Định Vị (ESP)"] = "👁️ ESP (มองทะลุ)",
    ["Di Chuyển"] = "🏃 การเคลื่อนที่",
    ["Chiến Đấu"] = "⚔️ การต่อสู้",
    ["TRỨNG NGOÀI SÂN"] = "🥚 ไข่ในสนาม",
    ["ESP Trứng"] = "👁️ ESP ไข่",
    ["Hiển thị"] = "📋 แสดง",
    ["Icon"] = "ไอคอน",
    ["Cố định kích cỡ"] = "📏 ขนาดคงที่",
    ["MỤC KHÁC"] = "📦 อื่นๆ",
    ["ESP trứng trong chuồng"] = "👁️ ESP ไข่ในคอก",
    ["ESP chuồng người khác"] = "👁️ ESP คอกอื่น",
    ["ESP Vệ sĩ"] = "👁️ ESP ยาม",
    ["Ẩn vệ sĩ đang ngủ"] = "💤 ซ่อนยามที่หลับ",
    ["ESP Người chơi"] = "👁️ ESP ผู้เล่น",
    ["Giá trị túi đồ"] = "💰 มูลค่าในกระเป๋า",
    ["Kích cỡ ESP"] = "📏 ขนาด ESP",
    ["TỐC ĐỘ & DI CHUYỂN"] = "🏃 การเคลื่อนที่",
    ["Tăng tốc chạy"] = "💨 เพิ่มความเร็ว",
    ["Tốc độ tăng thêm"] = "💨 ค่าความเร็ว",
    ["Nhảy vô hạn"] = "🦘 กระโดดไม่จำกัด",
    ["Bất tử (God mode)"] = "🛡️ โหมดพระเจ้า",
    ["BẢO VỆ NHÂN VẬT"] = "🛡️ การป้องกัน",
    ["Chống ngã (Anti Ragdoll)"] = "🛡️ กันล้ม",
    ["Bỏ qua bẫy"] = "🛡️ หลบกับดัก",
    ["Tương tác nhãn giữ tức thì"] = "⚡ โต้ตอบทันที",
    ["Chống treo máy (Anti AFK)"] = "💤 กันหลุด",
    ["Tàng hình"] = "👻 ล่องหน",
    ["TỰ ĐỘNG ĐÁNH"] = "⚔️ ตีอัตโนมัติ",
    ["Tự động đánh"] = "⚔️ ตีอัตโนมัติ",
    ["Mục tiêu đánh"] = "🎯 ตีใคร",
    ["Người gần nhất"] = "👤 ผู้เล่นที่ใกล้ที่สุด",
    ["Người chơi chỉ định"] = "👤 ผู้เล่นที่เลือก",
    ["Tốc độ đuổi theo"] = "💨 ความเร็วในการไล่",
    ["VÒNG ĐÁNH TỰ ĐỘNG"] = "⭕ ออร่าตี",
    ["Vòng đánh tự động (Hit Aura)"] = "⭕ ออร่าตี",
    ["Bỏ qua bạn bè"] = "⏭️ ข้ามเพื่อน",
    ["VŨ KHÍ"] = "🗡️ อาวุธ",
    ["Sử dụng vũ khí"] = "🗡️ ใช้อาวุธ",
    ["Thời gian cầm mỗi món"] = "⏱️ ถือแต่ละครั้ง",

    -- ⚙️ หน้าตั้งค่า (System - Server / Webhook / Optimizer / Interface / Config)
    ["Hệ Thống"] = "⚙️ ระบบ",
    ["Máy Chủ"] = "🌐 เซิร์ฟเวอร์",
    ["Webhook"] = "🔗 เว็บฮุค",
    ["Tối Ưu Hóa"] = "🚀 ปรับแต่งประสิทธิภาพ",
    ["Giao Diện"] = "🎨 อินเทอร์เฟซ",
    ["Cấu Hình"] = "📁 การตั้งค่า",
    ["MÁY CHỦ"] = "🌐 เซิร์ฟเวอร์",
    ["3 / 7 players - d181a603-a2e8"] = "ผู้เล่น 3 / 7 คน",
    ["Chuyển tới server"] = "🌐 ไปที่เซิร์ฟเวอร์",
    ["Ít người chơi nhất"] = "👤 ผู้เล่นน้อยที่สุด",
    ["Đổi máy chủ"] = "🌐 เปลี่ยนเซิร์ฟเวอร์",
    ["Đổi ngay"] = "เปลี่ยนเลย",
    ["Vào lại máy chủ này"] = "🔄 กลับเข้าเซิร์ฟเวอร์นี้",
    ["Vào lại"] = "กลับเข้า",
    ["Chép Job ID"] = "📋 คัดลอก Job ID",
    ["Sao chép"] = "คัดลอก",
    ["VÀO PHÒNG & DUY TRÌ"] = "🔗 เข้าร่วมและอยู่ต่อ",
    ["Mã phòng (Job ID)"] = "🆔 Job ID",
    ["Dán mã Job ID vào đây"] = "วาง Job ID ที่นี่",
    ["Vào máy chủ đó"] = "🔗 เข้าร่วมเซิร์ฟเวอร์นั้น",
    ["Vào ngay"] = "เข้าร่วมเลย",
    ["Tự vào lại khi bị văng/kick"] = "🔄 เข้าห้องใหม่เมื่อถูกเตะ",
    ["Tự chạy lại script khi chuyển server"] = "🚀 โหลดสคริปต์อัตโนมัติเมื่อเปลี่ยนเซิร์ฟเวอร์",
    ["WEBHOOK DISCORD"] = "🔗 ดิสคอร์ดเว็บฮุค",
    ["Đường dẫn Webhook"] = "🔗 URL เว็บฮุค",
    ["Tag @everyone"] = "📢 แท็กทุกคน",
    ["ID Người dùng (User ID)"] = "🆔 แท็ก ID ผู้ใช้",
    ["ID Vai trò (Role ID)"] = "🏷️ แท็ก ID ยศ",
    ["Chili Hub role ID"] = "ID ยศ Chilli Hub",
    ["ĐÃ GỬI"] = "📤 โพสต์แล้ว",
    ["ĐANG CHỜ"] = "⏳ กำลังรอ",
    ["Gửi tin nhắn thử nghiệm"] = "📤 ส่งข้อความทดสอบ",
    ["Thử nghiệm"] = "ทดสอบ",
    ["NỘI DUNG GỬI BÁO CÁO"] = "📝 สิ่งที่จะโพสต์",
    ["Báo cáo trứng cướp được"] = "🥚 โพสต์ไข่ที่ขโมยได้",
    ["Báo cáo trứng dung hợp"] = "🔧 โพสต์ไข่ที่ผสมแล้ว",
    ["Gửi thông báo khi đầy túi"] = "🎒 โพสต์เมื่อกระเป๋าเต็ม",
    ["TỐI ƯU HÓA"] = "🚀 ปรับแต่งประสิทธิภาพ",
    ["ĐỒ HỌA"] = "🖼️ กราฟิก",
    ["Đồ họa thấp (Tăng FPS)"] = "📉 กราฟิกต่ำ",
    ["Chế độ Tối Ưu Hóa"] = "🚀 โหมดปรับแต่ง",
    ["Mạnh"] = "ทรงพลัง",
    ["Tắt kết xuất 3D (Treo máy)"] = "🚫 ปิดการเรนเดอร์ 3D",
    ["Màu nền màn hình"] = "🎨 สีพื้นหลัง",
    ["Màu Trắng"] = "สีขาว",
    ["Ẩn giao diện gốc của Game"] = "👁️ ซ่อน UI เกม",
    ["TỐC ĐỘ KHUNG HÌNH (FPS)"] = "📺 อัตราเฟรม",
    ["Giới hạn FPS"] = "🎯 จำกัด FPS",
    ["CĂN CỨ (BASES)"] = "🏠 ฐาน",
    ["Ẩn pet và trứng của người chơi khác"] = "👁️ ซ่อนสัตว์เลี้ยงและไข่ของผู้เล่นอื่น",
    ["Ẩn pet và trứng của bản thân"] = "👁️ ซ่อนสัตว์เลี้ยงและไข่ของฉัน",
    ["GIAO DIỆN"] = "🎨 อินเทอร์เฟซ",
    ["Kích cỡ Menu"] = "📏 ขนาด UI",
    ["Phím ẩn / hiện Menu"] = "👁️ แสดง/ซ่อน UI",
    ["L Ctrl"] = "L Ctrl",
    ["Độ trong suốt"] = "💧 ความโปร่งใส",
    ["Tông màu"] = "🎨 โทนสี",
    ["Làm tối nền game"] = "🌑 ทำให้เกมมืดลง",
    ["CHỦ ĐỀ MÀU"] = "🎨 ธีม",
    ["Twilight"] = "🌆 Twilight",
    ["Aurora"] = "🌌 Aurora",
    ["Ocean"] = "🌊 Ocean",
    ["Midnight"] = "🌃 Midnight",
    ["Sakura"] = "🌸 ซากุระ",
    ["Onyx"] = "⬛ โอนิกซ์",
    ["Màu Đen"] = "⚫ สีดำ",
    ["Mono"] = "⬜ โมโน",
    ["THANH PHÍM TẮT NHANH"] = "⚡ แถบด่วน",
    ["Hiện thanh phím tắt nhanh"] = "👁️ แสดงแถบด่วน",
    ["Phím tắt"] = "⌨️ ปุ่มลัด",
    ["Kích cỡ thanh nhanh"] = "📏 ขนาดแถบ",
    ["GHIM & PHÍM TẮT"] = "📌 ปักหมุดและปุ่มลัด",
    ["tìm tùy chọn"] = "🔎 ค้นหาตัวเลือก",
    ["Tất cả"] = "ทั้งหมด",
    ["Đã ghim"] = "📌 ปักหมุด",
    ["CẤU HÌNH"] = "📁 การตั้งค่า",
    ["ĐANG DÙNG"] = "🟢 ใช้งานอยู่",
    ["ĐÃ LƯU"] = "💾 บันทึกแล้ว",
    ["Mặc định"] = "ค่าเริ่มต้น",
    ["Cấu Hình"] = "คอนฟิก",
    ["Đặt làm cấu hình chính"] = "🟢 ตั้งเป็นคอนฟิกหลัก",
    ["Kích hoạt"] = "ใช้งาน",
    ["Lưu thay đổi"] = "💾 บันทึกการเปลี่ยนแปลง",
    ["Lưu"] = "บันทึก",
    ["Tự động nạp cấu hình"] = "🚀 โหลดคอนฟิกอัตโนมัติ",
    ["Tự động lưu cấu hình"] = "💾 บันทึกคอนฟิกอัตโนมัติ",
    ["HỒ SƠ CẤU HÌNH"] = "👤 โปรไฟล์",
    ["Tên cấu hình mới"] = "📝 ชื่อคอนฟิกใหม่",
    ["Tự đặt nếu trống"] = "อัตโนมัติถ้าว่างเปล่า",
    ["Tạo cấu hình mới"] = "➕ สร้างคอนฟิกใหม่",
    ["Tạo mới"] = "สร้างใหม่",
    ["Chọn mục cần xóa"] = "🗑️ เลือกเพื่อลบ",
    ["Xóa mục đã chọn"] = "🗑️ ลบที่เลือก",
    ["Xóa"] = "ลบ",
    ["Khôi phục mục đã xóa"] = "🔄 กู้คืนที่ถูกลบ",
    ["Xuất mã cấu hình"] = "📤 ส่งออกคอนฟิก",
    ["Dán mã cấu hình"] = "📥 นำเข้าข้อความ",
    ["Dán mã JSON vào đây"] = "วางข้อความ JSON ที่นี่",
    ["Nhập cấu hình"] = "📥 นำเข้าคอนฟิก",
    ["Nhập"] = "นำเข้า",
}

-- ==========================================
-- 2. PREPARE DICTIONARY (Lowercase)
-- ==========================================
local lowerDict = {}
for key, value in pairs(dict) do
    lowerDict[string.lower(key)] = value
end

-- ==========================================
-- 3. TRANSLATE FUNCTIONS (Zero-Lag + Filter)
-- ==========================================
local function translateDynamicText(txt)
    local newTxt = txt
    newTxt = newTxt:gsub("^(%d+)%s+pets", "%1 ตัว")
    newTxt = newTxt:gsub("^(%d+)%s+eggs", "%1 ไข่")
    newTxt = newTxt:gsub("^(%d+)m%s+(%d+)s", "%1 นาที %2 วินาที")
    newTxt = newTxt:gsub("in (%d+)m", "ในอีก %1 นาที")
    newTxt = newTxt:gsub("^(%$[%d%.]+[BMTK]?/s)$", "💰 %1")
    newTxt = newTxt:gsub("^ALL%s+(%d+)", "ทั้งหมด %1")
    newTxt = newTxt:gsub("^READY%s+(%d+)", "พร้อม %1")
    newTxt = newTxt:gsub("^GROWING%s+(%d+)", "กำลังโต %1")
    newTxt = newTxt:gsub("^IN BAG%s+(%d+)", "ในกระเป๋า %1")
    return newTxt
end

local function translateText(obj)
    pcall(function()
        if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
        
        local currentText = obj.Text
        if currentText == "" then return end
        
        -- 🛑 ตัวกรองตัวเลข K M B T Q เงิน และ %
        local numberPattern = "^%s*[%$%+%-%xX]*%s*%d+%.?%d*%s*[KMBTQkmbtqiasI%%]*%s*/?%s*[sS]?%s*$"
        if currentText:match(numberPattern) then return end
        
        -- 🛑 ถ้าเป็นภาษาไทยอยู่แล้ว ให้ข้าม
        if currentText:match("^[ก-๙]") then return end

        local dynamicText = translateDynamicText(currentText)
        if dynamicText ~= currentText then
            obj.Text = dynamicText
            currentText = dynamicText
        end

        local cleanText = currentText:gsub("<[^>]+>", ""):match("^%s*(.-)%s*$")
        if cleanText then
            local translated = lowerDict[string.lower(cleanText)]
            if translated then
                obj.Text = translated
            end
        end

        if obj:IsA("TextBox") then
            local placeholder = obj.PlaceholderText or ""
            local cleanPlaceholder = placeholder:gsub("<[^>]+>", ""):match("^%s*(.-)%s*$")
            if cleanPlaceholder then
                local translatedPlaceholder = lowerDict[string.lower(cleanPlaceholder)]
                if translatedPlaceholder then
                    obj.PlaceholderText = translatedPlaceholder
                end
            end
        end
    end)
end

-- ==========================================
-- 4. HOOK OBJECT (Static Mode - ไม่แลค)
-- ==========================================
local function hookObject(obj)
    translateText(obj)
    pcall(function()
        if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
        if obj:GetAttribute("Hooked_nookky_") then return end
        obj:SetAttribute("Hooked_nookky_", true)
        -- 🛑 ไม่มี GetPropertyChangedSignal แล้ว! เกมจะไม่แลคเลย
    end)
end

-- ==========================================
-- 5. SMART LOADER (โหลด UI ก่อน -> รอ -> แปล)
-- ==========================================
task.spawn(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/sourceshubs/6e43ff13469a39993ac1a15ce00fd404/raw/SourcesHub_ChilliHubV8"))()
    end)
    if not success then
        warn("⚠️ nookky_ : โหลด Chilli Hub ต้นฉบับไม่สำเร็จ")
    end
end)

task.spawn(function()
    local timeout = 30
    local elapsed = 0
    local found = false

    while elapsed < timeout do
        for _, obj in ipairs(GuiService:GetDescendants()) do
            if (obj:IsA("TextLabel") or obj:IsA("TextButton")) then
                if obj.Text == "Dashboard" or obj.Text == "Chilli Hub" then
                    found = true
                    break
                end
            end
        end
        if found then break end
        task.wait(0.5)
        elapsed = elapsed + 0.5
    end

    -- สแกนและแปลครั้งแรก
    for _, obj in ipairs(GuiService:GetDescendants()) do
        hookObject(obj)
    end

    -- แปลเฉพาะตอนมี UI ใหม่โผล่ขึ้นมา (เช่น กดเปลี่ยนแท็บ)
    GuiService.DescendantAdded:Connect(function(obj)
        task.wait(0.1)
        hookObject(obj)
    end)
    
    -- แจ้งเตือน
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "🌶️ nookky_ (Static Mode)",
            Text = "ระบบแปลภาษาไทยพร้อมใช้งาน (ไม่แลค) ✅",
            Duration = 5
        })
    end)
end)

-- ==========================================
-- 6. 🎈 ปุ่มลอยสำหรับกดแปลใหม่ (Floating Button)
-- ==========================================
local function createTranslateButton()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "nookky_TranslateBtn"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = GuiService

    local btn = Instance.new("TextButton")
    btn.Parent = ScreenGui
    btn.Size = UDim2.new(0, 45, 0, 45)
    btn.Position = UDim2.new(0, 20, 0.5, -25)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    btn.BackgroundTransparency = 0.2
    btn.Text = "🇹🇭"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 20
    btn.Font = Enum.Font.GothamBold
    btn.Active = true
    btn.Draggable = true
    btn.BorderSizePixel = 0
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = btn

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(255, 255, 255)
    UIStroke.Thickness = 1.5
    UIStroke.Transparency = 0.5
    UIStroke.Parent = btn

    local isTranslating = false
    btn.MouseButton1Click:Connect(function()
        if isTranslating then return end
        isTranslating = true

        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "🌶️ nookky_",
                Text = "กำลังสแกนและแปล UI ใหม่... ⏳",
                Duration = 2
            })
        end)

        local count = 0
        for _, obj in ipairs(GuiService:GetDescendants()) do
            if (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then
                translateText(obj)
                count = count + 1
            end
        end

        task.wait(0.5)
        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "🌶️ nookky_",
                Text = "แปลภาษาเสร็จสิ้น! (ตรวจสอบ " .. count .. " รายการ) ✅",
                Duration = 3
            })
        end)

        task.wait(1.5)
        isTranslating = false
    end)
end

task.spawn(createTranslateButton)
