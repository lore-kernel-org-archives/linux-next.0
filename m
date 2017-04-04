From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the keys tree
Date: Tue, 4 Apr 2017 13:39:02 +1000
Message-ID: <20170404133902.2c300679@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32787 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751460AbdDDDjF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Apr 2017 23:39:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mat Martineau <mathew.j.martineau@linux.intel.com>

Hi David,

After merging the keys tree, today's linux-next build (x86_64
allmodconfig) failed like this:

security/integrity/digsig.c: In function 'integrity_init_keyring':
security/integrity/digsig.c:46:30: error: passing argument 7 of 'keyring_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
 #define restrict_link_to_ima restrict_link_by_builtin_and_secondary_trusted
                              ^
security/integrity/digsig.c:95:9: note: in expansion of macro 'restrict_link_to_ima'
         restrict_link_to_ima, NULL);
         ^
In file included from include/linux/cred.h:17:0,
                 from security/integrity/digsig.c:18:
include/linux/key.h:311:20: note: expected 'struct key_restriction *' but argument is of type 'int (*)(struct key *, const struct key_type *, const union key_payload *, struct key *)'
 extern struct key *keyring_alloc(const char *description, kuid_t uid, kgid_t gid,
                    ^

Caused by commits

  aaf66c883813 ("KEYS: Split role of the keyring pointer for keyring restrict functions")
  c5faca6b4a58 ("KEYS: Use structure to capture key restriction function and data")

I have used the version from next-20170403 for today.

-- 
Cheers,
Stephen Rothwell
