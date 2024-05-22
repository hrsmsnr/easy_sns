/* global $ */
document.addEventListener('turbolinks:load', function() {
  function setSequenceNumbers() {
    const allItems = $('#post-details').find('.nested-fields');
    allItems.each((index, item) => {
      $(item).find('label').text(`${index + 1}.`);
      $(item).find('input[name*="[sequence_number]"]').val(index + 1);
    });
  }

  function togglePostDetails() {
    const category = $('#post_category').val();
    console.log("Selected category:", category);
    if (category === "日常") {
      $('#post-details').hide();
    } else {
      $('#post-details').show();
      setSequenceNumbers();
    }
  }

  $('#post_category').on('change', togglePostDetails);

  // 初期表示設定
  togglePostDetails();

  $('#post-details').on('cocoon:after-insert', function(e, insertedItem) {
    setSequenceNumbers();
  });

  $('#post-details').on('cocoon:after-remove', function(e) {
    setSequenceNumbers();
  });

  $('#post_form').on('submit', function() {
    const category = $('#post_category').val();
    if (category === "日常") {
      // フィールドを無効にする
      $('#post-details').find('input, textarea').attr('disabled', true);
    } else {
      // フィールドを有効にする
      $('#post-details').find('input, textarea').attr('disabled', false);
    }
  });

});
