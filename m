From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: linux-next: manual merge of the bcon tree
Date: Tue, 1 Oct 2013 10:26:55 -0400
Message-ID: <20131001142655.GA29919@logfs.org>
References: <20131001110344.GA20249@ulmo.nvidia.com>
 <1380625644-11331-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from longford.logfs.org ([213.229.74.203]:57986 "EHLO
	longford.logfs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751093Ab3JAPpx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Oct 2013 11:45:53 -0400
Content-Disposition: inline
In-Reply-To: <1380625644-11331-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 1 October 2013 13:07:17 +0200, Thierry Reding wrote:
>=20
> Today's linux-next merge of the bcon tree got conflicts in:
>=20
> 	drivers/block/Kconfig
> 	kernel/printk.c
>=20
> I fixed them up (see below). Please check if the resolution looks cor=
rect.

I think for the moment you can drop the bcon tree.  I have plans to
get it merged into mainline eventually, but currently lack time to
spend on it.  In other words, it isn't really -next material.

J=C3=B6rn

--
Doubt is not a pleasant condition, but certainty is an absurd one.
-- Voltaire
