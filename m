From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH -next] staging: altera-jtag needs delay.h
Date: Wed, 30 Mar 2011 01:27:44 +0400
Message-ID: <AANLkTinhKKtPS7-tFcoU8JE=zsgikEn979DemyXX8q_z@mail.gmail.com>
References: <20110304180027.20deb6c4.sfr@canb.auug.org.au>
	<20110304173528.60c04f76.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:57908 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751975Ab1C2V1p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Mar 2011 17:27:45 -0400
In-Reply-To: <20110304173528.60c04f76.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Igor M. Liplianin" <liplianin@netup.ru>

On 5 March 2011 04:35, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> altera-jtag.c needs to include <linux/delay.h> to fix a build error:
>
> drivers/staging/altera-stapl/altera-jtag.c:398: error: implicit declaration of function 'udelay'
>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Igor M. Liplianin <liplianin@netup.ru>

Mauro, Greg. 2.6.39 still needs this fix.
