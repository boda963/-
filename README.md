# تشغيل MiroFish الأصلية مجانًا عبر GitHub Codespaces

هذا **مشغّل** للأداة الرسمية [666ghj/MiroFish](https://github.com/666ghj/MiroFish)؛ لا يغيّر كودها. ينزّل الفرع الرسمي `main` ويثبّت المتطلبات في Codespace.

## الخطوات

1. افتح [Codespaces لهذا المستودع](https://codespaces.new/boda963/-)، واختر جهازًا بـ **2 cores**. حافظ على المنفذ **3000** في وضع **Private**.
2. سيقوم `postCreateCommand` بتنزيل مشروع MiroFish وإعداد الاعتماديات. إن فشل شغّل `bash scripts/setup.sh`.
3. أنشئ **Gemini API key** مجانيًا من [Google AI Studio](https://aistudio.google.com/apikey)، و**Zep API key** من [Zep](https://app.getzep.com/).
4. أضفهما إلى [GitHub Codespaces Secrets](https://github.com/settings/codespaces) بالأسماء `GEMINI_API_KEY` و`ZEP_API_KEY`، واسمح لهذا المستودع بالوصول إليهما. أعد تشغيل Codespace ليصبحا متاحين كمتغيرات بيئة.
5. من جذر هذا المستودع افتح terminal ونفّذ `bash scripts/start.sh`.
6. افتح **PORTS → 3000 → Open in Browser** لرؤية واجهة MiroFish.

**احفظ مفاتيح API خاصة؛ لا تشاركها في الدردشة أو تضعها في GitHub.**

## التكلفة والقيود

- GitHub Codespaces يمنح حساب GitHub الشخصي حصة شهرية مجانية محدودة، وليس استضافة دائمة. اترك جهاز Codespaces على **2 cores** ولا تضف وسيلة دفع أو تفعّل خدمات مدفوعة.
- يبدأ هذا المشغل بنموذج `gemini-2.5-flash-lite` عبر Gemini API Free tier إن كان متاحًا لحسابك. توافق جميع مراحل MiroFish مع Gemini **غير مضمون** بسبب اعتماد MiroFish على مخرجات منظّمة وميزات API خاصة.
- Zep Cloud لديه حصة مجانية محدودة، لكن المحاكاة الكثيفة قد تتخطى الحدود. نجاح التثبيت لا يضمن محاكاة كاملة مجانية.
- جرّب ملف نصي قصير ومحاكاة صغيرة أولًا. لا تضع بيانات حساسة؛ خطة Gemini المجانية قد تستخدم المحتوى لتحسين الخدمات.
- لا تجعل منفذ 3000 عامًا: المشروع الرسمي ليس مصممًا للخدمة العامة الآمنة متعددة المستخدمين.

## الإعداد

`scripts/setup.sh` يستنسخ المصدر الأصلي في `mirofish-app/` ويثبت اعتمادياته. `scripts/start.sh` يبني ملف `.env` الخاص محليًا اعتمادًا على المتغيرات السرية، ويضبط `VITE_API_BASE_URL=/` لاستخدام الـVite proxy حتى يشتغل المتصفح من الموبايل. منفذ الـAPI `5001` غير معروض للعامة.

لتغيير مزوّد الذكاء الاصطناعي، استخدم متغيرات البيئة `LLM_API_KEY`, `LLM_BASE_URL`, و`LLM_MODEL_NAME`. يظل `ZEP_API_KEY` مطلوبًا.

**المصدر والرخصة:** [666ghj/MiroFish](https://github.com/666ghj/MiroFish) (AGPL-3.0).
