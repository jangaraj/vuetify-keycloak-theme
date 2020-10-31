new Vue({
  el: "#app",
  vuetify: new Vuetify(), 
  data() {
    return {
      rules: {
        required: (value) => !!value || ""
      },
      showpassword: false,
      loading: false
    };
  },
  methods: {
    submit() {
      console.log("submit")
      console.log(this)
      this.loading = true
    }
  }
});
