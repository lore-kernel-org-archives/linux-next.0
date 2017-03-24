From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the leds tree with the drivers-x86 tree
Date: Fri, 24 Mar 2017 13:52:57 +1100
Message-ID: <20170324135257.476144fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34749 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934882AbdCXCxA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Mar 2017 22:53:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Darren Hart <dvhart@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Hans de Goede <hdegoede@redhat.com>

Hi Jacek,

Today's linux-next merge of the leds tree got a conflict in:

  drivers/platform/x86/dell-laptop.c

between commit:

  573eedacfba3 ("platform/x86: dell-*: Call new led hw_changed API on kbd brightness change")

from the drivers-x86 tree and commit:

  44319ab7e0ed ("platform/x86: dell-laptop: import dell_micmute_led_set() from drivers/leds/dell-led.c")

from the leds tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/platform/x86/dell-laptop.c
index 1cd258b790e8,2e237bad4995..000000000000
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@@ -2026,26 -1981,31 +2029,51 @@@ static void kbd_led_exit(void
  	led_classdev_unregister(&kbd_led);
  }
  
 +static int dell_laptop_notifier_call(struct notifier_block *nb,
 +				     unsigned long action, void *data)
 +{
 +	switch (action) {
 +	case DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED:
 +		if (!kbd_led_present)
 +			break;
 +
 +		led_classdev_notify_brightness_hw_changed(&kbd_led,
 +						kbd_led_level_get(&kbd_led));
 +		break;
 +	}
 +
 +	return NOTIFY_OK;
 +}
 +
 +static struct notifier_block dell_laptop_notifier = {
 +	.notifier_call = dell_laptop_notifier_call,
 +};
 +
+ int dell_micmute_led_set(int state)
+ {
+ 	struct calling_interface_buffer *buffer;
+ 	struct calling_interface_token *token;
+ 
+ 	if (state == 0)
+ 		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE);
+ 	else if (state == 1)
+ 		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE);
+ 	else
+ 		return -EINVAL;
+ 
+ 	if (!token)
+ 		return -ENODEV;
+ 
+ 	buffer = dell_smbios_get_buffer();
+ 	buffer->input[0] = token->location;
+ 	buffer->input[1] = token->value;
+ 	dell_smbios_send_request(1, 0);
+ 	dell_smbios_release_buffer();
+ 
+ 	return state;
+ }
+ EXPORT_SYMBOL_GPL(dell_micmute_led_set);
+ 
  static int __init dell_init(void)
  {
  	struct calling_interface_buffer *buffer;
