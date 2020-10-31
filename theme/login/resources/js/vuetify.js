new Vue({
  el: "#app",
  vuetify: new Vuetify(), 
  data() {
    return {
      rules: {
        required: (value) => !!value || ""
      },
      showpassword: false,
      loading: false,
      dark: false
    };
  },

  mounted() {
    const theme = localStorage.getItem("dark_theme");
    if (theme) {
      if (theme == "true") {
        this.$vuetify.theme.dark = true;
      } else {
        this.$vuetify.theme.dark = false;
      }
    }
  },

  methods: {
    submit() {
      this.loading = true
    },
    toggle_dark_mode: function () {
      this.$vuetify.theme.dark = !this.$vuetify.theme.dark;
      localStorage.setItem("dark_theme", this.$vuetify.theme.dark.toString());
    }
  }
});
