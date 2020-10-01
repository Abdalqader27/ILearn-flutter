class StepModel {
  final int id;
  final String text;

  StepModel({this.id, this.text});

  static List<StepModel> list = [
    StepModel(
      id: 1,
      text: "منصة تعليمية  \n يحتوى على مجموعة متنوعة من الأنشطة التفاعلية\n\لجميع طلاب البكالوريا في سوريا \n",
    ),
    StepModel(
      id: 2,
      text:
          "التطبيق غني بلمعلومات  والمناهج الدراسية بلإضافة إلى اختبارات وترتيبات وجوائز ",
    ),
    StepModel(
      id: 3,
      text: "وفيديوهات وألعاب تفاعلية مع مختلف الموادِّ وحتى المهارات التنفيذية كالتركيز والذاكرة والمنطق والمشاعر وحل المشاكل. ",
    ),
  ];
}
