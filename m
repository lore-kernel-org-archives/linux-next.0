From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the keys tree
Date: Mon, 13 Nov 2017 13:08:08 +1100
Message-ID: <20171113130808.12d7ec72@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45865 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750954AbdKMCIK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Nov 2017 21:08:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi David,

After merging the keys tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/md/dm-crypt.c: In function 'crypt_set_keyring_key':
drivers/md/dm-crypt.c:2022:8: error: too few arguments to function 'request_key'
  key = request_key(key_string[0] == 'l' ? &key_type_logon : &key_type_user,   
        ^
In file included from drivers/md/dm-crypt.c:15:0:
include/linux/key.h:268:20: note: declared here
 extern struct key *request_key(struct key_type *type,
                    ^

Caused by commit

  b059d2a56c53 ("KEYS: Replace uid/gid/perm permissions checking with an ACL")

I have used the keys tree from next-20171110 for today.

-- 
Cheers,
Stephen Rothwell
