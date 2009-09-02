From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: manual merge of the block tree with the ubifs tree
Date: Wed, 02 Sep 2009 08:42:44 +0300
Message-ID: <4A9E05D4.4050206@nokia.com>
References: <20090902153657.dc174bf6.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:51619 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755776AbZIBFnu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2009 01:43:50 -0400
In-Reply-To: <20090902153657.dc174bf6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 09/02/2009 08:36 AM, ext Stephen Rothwell wrote:
> Hi Jens,
>
> Today's linux-next merge of the block tree got a conflict in
> fs/ubifs/super.c between commit 887ee17117fd23e962332b353d250ac9e090b=
20f
> ("UBIFS: remove unneeded call from ubifs_sync_fs") from the ubifs tre=
e
> and commit 0184fca792940a9e4058b2c63b3f334326a4c7af ("writeback: move
> super_block argument to struct writeback_control") from the block tre=
e.
>
> The former removes the code that the latter changes.  I just used the
> version from the ubifs tree.  I can carry this fixup as necessary.

Yeah, I remove the call because it is not needed anymore.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
