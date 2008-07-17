From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: manual merge of the ubifs tree
Date: Thu, 17 Jul 2008 10:23:21 +0300
Message-ID: <487EF369.2080609@nokia.com>
References: <20080717171059.1bf8b572.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:33284 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751555AbYGQH0E (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 03:26:04 -0400
In-Reply-To: <20080717171059.1bf8b572.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen

Stephen Rothwell wrote:
> Today's linux-next merge of the ubifs tree got conflicts in
> fs/ubifs/budget.c, fs/ubifs/debug.c, fs/ubifs/dir.c, fs/ubifs/file.c,
> fs/ubifs/io.c, fs/ubifs/journal.c, fs/ubifs/shrinker.c, fs/ubifs/tnc.=
c
> and fs/ubifs/xattr.c between commit
> 1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d ("UBIFS: add new flash file
> system") from Linus' tree and various commits from the ubifs tree.

Yes, right. I guess I should have informed you about this, apologies.

UBIFS is rather non-typical things for -next I guess.

No one is interested in UBIFS history _before_ it got into mainline,
which is about several hundred commits. Thus, we folded these all
into few huge large commits, in order not to garbage the mainline
tree.

I have amended the 'for_andrew' branch of ubifs-2.6.git, and now it
has the same commits as in Linus's tree. But it is still based on
2.6.26 release.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
