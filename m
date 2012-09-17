From: Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: the return of jfs-next
Date: Sun, 16 Sep 2012 20:07:35 -0500
Message-ID: <505677D7.5030505@oracle.com>
References: <5053A83A.9000802@oracle.com> <20120917102051.440fb6a55d1eed00bc48c701@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:31790 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754105Ab2IQBHn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 16 Sep 2012 21:07:43 -0400
In-Reply-To: <20120917102051.440fb6a55d1eed00bc48c701@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/16/2012 07:20 PM, Stephen Rothwell wrote:
> Hi Dave,
> 
> On Fri, 14 Sep 2012 16:57:14 -0500 Dave Kleikamp
> <dave.kleikamp@oracle.com> wrote:
>> 
>> It's been a while, and I've never recovered my kernel.org
>> account, but I've got some jfs patches for linux-next at github:
>> 
>> git://github.com/kleikamp/linux-shaggy.git jfs-next
>> 
>> Can you please add this branch back into linux-next?
> 
> Back from today.  You will, of course, need to use a signed tag to
> get Linus to fetch from that tree.
> 
> Thanks for adding your subsystem tree as a participant of
> linux-next.  As you may know, this is not a judgment of your code.
> The purpose of linux-next is for integration testing and to lower
> the impact of conflicts between subsystems in the next merge
> window.
> 
> You will need to ensure that the patches/commits in your
> tree/series have been: * submitted under GPL v2 (or later) and
> include the Contributor's Signed-off-by, * posted to the relevant
> mailing list, * reviewed by you (or another maintainer of your
> subsystem tree), * successfully unit tested, and * destined for the
> current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask
> him to fetch).  It is allowed to be rebased if you deem it
> necessary.

Understood and agreed.

Shaggy
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQVnfXAAoJEDaohF61QIxkgKMP/0paM4jGBfiY84JHvMTCD/4Q
QVs+MxoCAa5tDck8VMVQIoePbLYbBT1X20s2Bz+P+aXWoAAvlW0BYoKZRujzyVcJ
Z04I29Z2P/K+L2N67lb8y8j6Md5i7FLbk7Hv39tPu2as6zeDf/T0k7dnRTTRwE7v
bYJ7zwgpgaNMCMEV0aq1xOMSuGPZuHhCtxl0+D1rP2P6O+YQkDaWmAZh35OdMdia
NZkoR6Kr/m7vp2Ua07iTCLSu2HC3vnEhyufHPvueywrDgGp6v74En9s+EA8yrPD5
+f+xR+y+UXPMASazUQIMHElLHP2lkggnCVpb78RxrfAcDEEkQBpXULIDQCd+6qmS
4DA5BlpRawi7UcyLnLdzKdJefpxVN2mw3zmxHRJWe7XPbUhXpMvKYJAkSBSdru7F
Aq1ovuRZpp95ODZAG3GfPA9/LzrRHMp5vboUSqun4UdNe+zdFY7tq90J7AFCnOrq
FlH/wLUFASA6eaGnAS6Wk0Z5LNNqQ/NemC5Ert3TVDcqvKz2gDbQz9m2eYFMUB/W
gGWCBHkNGT68zqV2nwtIow10u0PfXIn7b+vZmZbsGFgbRwVZCPdMfQ/veuycHh0i
s1wgUwTSk23bGP97aF2X0RnAJQBqUsg1cFDZq2RBEszgVFfrBCo7a6NCWrXxo3BA
RAGu6VERl7I6rJ8Uei+/
=9Rsp
-----END PGP SIGNATURE-----
