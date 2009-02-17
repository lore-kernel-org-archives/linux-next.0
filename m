From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the hid tree
Date: Tue, 17 Feb 2009 16:11:51 +1100
Message-ID: <20090217161151.0f6e64ef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55172 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751024AbZBQFL4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 00:11:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>, Jiri Kosina <jikos@jikos.cz>, Arjan van de Ven <arjan@linux.intel.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
drivers/hid/hid-core.c between commit
8390887fae55be9c06e3f064464d2bc8e908b8df ("HID: autosuspend support for
USB HID") from the hid tree and commit
c7b902168e6b06e91033bfaf71ca0174ad66c6aa ("use the new
request_module_nowait() in the hid driver") from the rr tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/hid/hid-core.c
index feaeb61,d51331f..0000000
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@@ -1813,31 -1812,6 +1813,22 @@@ void hid_unregister_driver(struct hid_d
  }
  EXPORT_SYMBOL_GPL(hid_unregister_driver);
  
- #ifdef CONFIG_HID_COMPAT
- static void hid_compat_load(struct work_struct *ws)
- {
- 	request_module("hid-dummy");
- }
- static DECLARE_WORK(hid_compat_work, hid_compat_load);
- static struct workqueue_struct *hid_compat_wq;
- #endif
- 
 +int hid_check_keys_pressed(struct hid_device *hid)
 +{
 +	struct hid_input *hidinput;
 +	int i;
 +
 +	list_for_each_entry(hidinput, &hid->inputs, list) {
 +		for (i = 0; i < BITS_TO_LONGS(KEY_MAX); i++)
 +			if (hidinput->input->key[i])
 +				return 1;
 +	}
 +
 +	return 0;
 +}
 +
 +EXPORT_SYMBOL_GPL(hid_check_keys_pressed);
 +
  static int __init hid_init(void)
  {
  	int ret;
