From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH next 2/2] pohmelfs: fix printk format warnings
Date: Fri, 13 Feb 2009 17:37:28 +0300
Message-ID: <a4423d670902130637h8a7addfgd1ddb8fb590dc507@mail.gmail.com>
References: <20090213125944.GB7003@orion> <20090213131400.GF23879@ioremap.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f21.google.com ([209.85.219.21]:41957 "EHLO
	mail-ew0-f21.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756706AbZBMOhb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2009 09:37:31 -0500
In-Reply-To: <20090213131400.GF23879@ioremap.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2009/2/13 Evgeniy Polyakov <zbr@ioremap.net>:
> Hi Alexander.
>
> On Fri, Feb 13, 2009 at 03:59:44PM +0300, Alexander Beregalov (a.beregalov@gmail.com) wrote:
>> drivers/staging/pohmelfs/inode.c:917: warning: format '%u' expects type 'unsigned int', but argument 4 has type 'size_t'
>> drivers/staging/pohmelfs/inode.c:1036: warning: format '%u' expects type 'unsigned int', but argument 7 has type 'size_t'
>> drivers/staging/pohmelfs/trans.c:164: warning: format '%u' expects type 'unsigned int', but argument 5 has type '__kernel_size_t'
>> drivers/staging/pohmelfs/trans.c:170: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'
>> drivers/staging/pohmelfs/trans.c:517: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
>> drivers/staging/pohmelfs/trans.c:600: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
>> drivers/staging/pohmelfs/trans.c:610: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'
>
> Doesn't size_t have %zu format?
Hi

Thanks for the tip, may I rewrite the patch?
