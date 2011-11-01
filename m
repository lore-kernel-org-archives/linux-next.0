From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: build failure after merge of the edac tree
Date: Tue, 01 Nov 2011 09:58:02 -0200
Message-ID: <4EAFDECA.3040007@redhat.com>
References: <20111101170000.6e7301a30bc21e917631eb88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:50348 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753947Ab1KAL6J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Nov 2011 07:58:09 -0400
In-Reply-To: <20111101170000.6e7301a30bc21e917631eb88@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <borislav.petkov@amd.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Em 01-11-2011 04:00, Stephen Rothwell escreveu:
> Hi Mauro,
> 
> After merging the edac tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> arch/x86/kernel/cpu/mcheck/mce.c:39:28: fatal error: linux/edac_mce.h: No such file or directory
> 
> Caused by commit cdaf4f4e563c ("i7core_edac: Drop the edac_mce
> facility").  This commit removed the file include/linux/edac_mce.h which
> is still metioned by the above file (and MAINTAINERS).  Grep is your
> friend.

Sorry, it were caused by a bad merge conflict resolution. The include
isn't need anymore.

The MAINTAINERS fix is indeed needed.

> I have used the version of the edac tree from next-20111025 for today.

I'm fixing both issues for tomorrow's next.

Thanks,
Mauro.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJOr96/AAoJEGO08Bl/PELn/asQAIIqZ+yth5ZEka4FFAnuFOyI
Cez2u5rU5WKkxnlqn3lDjq5pBR5/uvVGqDvNFurTzGwFFqRb2SNDh4LL8m0nXJ8O
JF2zs7n6ZtO5h3KMy5j9PuDDQcwFf3FUB9WRY/4LvGINCqNit+inrdYcbSKB1NDD
M3nF63tdv4HmpsI/7iriKfeUwWYHoOkHYdXFoPRxGdSBabW0GpEtjMAtBw8E1DXG
1hdOTBnpOyH2m/XIsZwYav09BitdOH/OzoyRRDPvFVOuofvsOLPxAq649x4DCiTo
XBjMma9JyiiqXjKl2t7T16Vgvp0TSiB5i2LXfIZdMIjpWKvyoEVM6+E75woBgwyX
iEOKdRrvPIdO0lU7+rkrW0sKVKdZpmpJl0vAVYSApyxpS4yxeBsLxakzbI6RoCdC
IKSY8QbIe7mj5Mp4LmOxZ+kMXgdttSdeloVfOOQzEtMMLY6Gf5wiodz0uEy19ouX
iCE8KzZRVgcgop+reG/jqTNv0/RwGMbsOdiaog6PmVDZY8z3WVKkA7IS0tUHCT7E
oEY+MIaS/OmKhRXhzjAsdkghbKBruZS1ai+kZ5MOl7gkaN1mK0c2FFueda6oxxhV
4p00mEmL+jwyx8dIKEdOHMMnziRSOlU+8xQubAJLNDnimVJ0eHJXvKlHZIGaVQfp
1vMymFukiedpFWjKaU4J
=s7ei
-----END PGP SIGNATURE-----
