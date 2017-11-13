From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the keys tree
Date: Mon, 13 Nov 2017 13:10:56 +1100
Message-ID: <20171113131056.14b3f4da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751062AbdKMCK6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Nov 2017 21:10:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi David,

After merging the keys tree, today's linux-next build (arm
multi_v7_defconfiga) produced these warning:

certs/system_keyring.c:39:23: warning: 'trusted_keyring_acl' defined but not used [-Wunused-variable]
 static struct key_acl trusted_keyring_acl = {
                       ^
net/wireless/reg.c: In function 'load_keys_from_buffer':
net/wireless/reg.c:688:9: warning: passing argument 6 of 'key_create_or_update' makes pointer from integer without a cast [-Wint-conversion]
         ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
         ^
In file included from include/linux/cred.h:17:0,
                 from include/linux/seq_file.h:12,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/platform_device.h:14,
                 from net/wireless/reg.c:55:
include/linux/key.h:297:18: note: expected 'struct key_acl *' but argument is of type 'int'
 extern key_ref_t key_create_or_update(key_ref_t keyring,
                  ^
net/wireless/reg.c: In function 'load_builtin_regdb_keys':
net/wireless/reg.c:715:10: warning: passing argument 5 of 'keyring_alloc' makes pointer from integer without a cast [-Wint-conversion]
          ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
          ^
In file included from include/linux/cred.h:17:0,
                 from include/linux/seq_file.h:12,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/platform_device.h:14,
                 from net/wireless/reg.c:55:
include/linux/key.h:315:20: note: expected 'struct key_acl *' but argument is of type 'int'
 extern struct key *keyring_alloc(const char *description, kuid_t uid, kgid_t gid,
                    ^

-- 
Cheers,
Stephen Rothwell
