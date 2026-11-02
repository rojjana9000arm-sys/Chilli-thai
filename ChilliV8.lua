-- ==========================================
-- 🌶️ Chilli Hub V8 - Thai Translator (Fixed Timing)
-- แปลไทยโดย : nookky_ 👑
-- ==========================================

local GuiService = gethui and gethui() or game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

-- ==========================================
-- 1. DICTIONARY (คำศัพท์ทั้งหมด)
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
    
    -- 🗺️ โซนแผนที่ (จากรูปที่ 2)
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

    -- 👽 กิจกรรม UFO (จากรูปที่ 1)
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

    -- 🎁 Event อื่นๆ
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
}

-- ==========================================
-- 2. LOWERCASE DICTIONARY
-- ==========================================
local lowerDict = {}
for key, value in pairs(dict) do
    lowerDict[string.lower(key)] = value
end

-- ==========================================
-- 3. ฟังก์ชันแปลภาษา (Dynamic & Static)
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

local function hookObject(obj)
    translateText(obj)
    pcall(function()
        if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
        if obj:GetAttribute("Hooked_nookky_") then return end

        obj:SetAttribute("Hooked_nookky_", true)
        obj:GetPropertyChangedSignal("Text"):Connect(function()
            translateText(obj)
        end)

        if obj:IsA("TextBox") then
            obj:GetPropertyChangedSignal("PlaceholderText"):Connect(function()
                translateText(obj)
            end)
        end
    end)
end

-- ==========================================
-- 4. ลำดับการทำงาน (โหลด UI ก่อน แล้วค่อยแปล)
-- ==========================================

-- ขั้นแรก: โหลด Chilli Hub ขึ้นมาก่อนเลย
task.spawn(function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/sourceshubs/6e43ff13469a39993ac1a15ce00fd404/raw/SourcesHub_ChilliHubV8"))()
end)

-- ขั้นที่สอง: รอให้ UI หลักโหลดเสร็จ (ประมาณ 2 วินาที)
task.wait(2) 

-- ขั้นที่สาม: สแกน UI ทั้งหมดที่เพิ่งโหลดขึ้นมา แล้วเริ่มดักจับของใหม่
for _, obj in ipairs(GuiService:GetDescendants()) do
    hookObject(obj)
end

GuiService.DescendantAdded:Connect(function(obj)
    task.wait(0.05)
    hookObject(obj)
end)

-- แจ้งเตือนตอนโหลดเสร็จ
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "🌶️ nookky_",
        Text = "ระบบแปลภาษาไทยพร้อมใช้งานแล้ว ✅",
        Duration = 5
    })
end)
