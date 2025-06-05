import Component from "@ember/component";
import { classNames, tagName } from "@ember-decorators/component";

@tagName("div")
@classNames("topic-title-outlet", "gradle-issue-link")
export default class GradleIssueLink extends Component {
  init() {
    super.init(...arguments);
    const tags = this.model.get("tags") || [];
    const bugTag = tags.find((t) => /^gradle\-\d+$/i.test(t));
    if (bugTag) {
      this.set("gradleBugId", bugTag);
      this.set("gradleBugUrl", `http://issues.gradle.org/browse/${bugTag}`);
    }
  }

  <template>
    {{#if this.gradleBugId}}
      <div class="alert alert-info">
        This discussion is linked to issue
        <a href={{this.gradleBugUrl}}>{{this.gradleBugId}}</a>
      </div>
    {{/if}}
  </template>
}
