From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH next 2/2] pohmelfs: fix printk format warnings
Date: Fri, 13 Feb 2009 16:14:00 +0300
Message-ID: <20090213131400.GF23879@ioremap.net>
References: <20090213125944.GB7003@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cet.com.ru ([195.178.208.66]:45378 "EHLO tservice.net.ru"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753219AbZBMNOK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Feb 2009 08:14:10 -0500
Content-Disposition: inline
In-Reply-To: <20090213125944.GB7003@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Alexander.

On Fri, Feb 13, 2009 at 03:59:44PM +0300, Alexander Beregalov (a.beregalov@gmail.com) wrote:
> drivers/staging/pohmelfs/inode.c:917: warning: format '%u' expects type 'unsigned int', but argument 4 has type 'size_t'
> drivers/staging/pohmelfs/inode.c:1036: warning: format '%u' expects type 'unsigned int', but argument 7 has type 'size_t'
> drivers/staging/pohmelfs/trans.c:164: warning: format '%u' expects type 'unsigned int', but argument 5 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:170: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:517: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:600: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:610: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'

Doesn't size_t have %zu format?

-- 
	Evgeniy Polyakov
