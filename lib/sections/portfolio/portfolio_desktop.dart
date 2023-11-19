import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/utils/project_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';
import 'package:folio/widget/community_button.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/project_card.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nPortfolio",
          ),
          const CustomSectionSubHeading(
            text: "Here are few samples of my previous work :)\n\n",
          ),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: AppDimensions.normalize(10),
            children: ProjectUtils.banners
                .asMap()
                .entries
                .map(
                  (e) => ProjectCard(
                    banner: e.value,
                    projectIcon: ProjectUtils.icons[e.key],
                    projectLink: ProjectUtils.links[e.key],
                    projectTitle: ProjectUtils.titles[e.key],
                    projectDescription: ProjectUtils.description[e.key],
                  ),
                )
                .toList(),
          ),
          // Space.y2!,

          const CustomSectionHeading(
            text: "\nAlso Work on",
          ),
          const CustomSectionSubHeading(
            text: "Here are some of the projects that I work on :)\n\n",
          ),

          Row(
            children: [
              ...WorkUtils.logos.asMap().entries.map(
                    (e) => Expanded(
                      child: CommunityIconBtn(
                        icon: e.value,
                        link: WorkUtils.communityLinks[e.key],
                        height: 70,
                      ),
                    ),
                  )
            ],
          )
          // SizedBox(
          //   height: AppDimensions.normalize(14),
          //   width: AppDimensions.normalize(50),
          //   child: OutlinedButton(
          //     onPressed: () => openURL(StaticUtils.gitHub),
          //     child: Text(
          //       'See More',
          //       style: AppText.l1b,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
