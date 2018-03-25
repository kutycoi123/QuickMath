jQuery(function() {
  return $('#search-input').autocomplete({
    source: $('#search-input').data('autocomplete-source')
  });
});