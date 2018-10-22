export default {
  setupComponent(args, component) {
    const tags = args.model.get("tags") || [];
    const bugTag = tags.find(t => /^gradle\-\d+$/i.test(t));

    if (bugTag) {
      component.set("gradleBugId", bugTag);
      component.set(
        "gradleBugUrl",
        `http://issues.gradle.org/browse/${bugTag}`
      );
    }
  }
};
