From: Frank Seidel <frank@f-seidel.de>
Subject: Re: [PATCH next] Staging: pohmelfs: fix printk format warnings v2
Date: Fri, 13 Feb 2009 16:16:27 +0100
Message-ID: <49958ECB.8060001@f-seidel.de>
References: <20090213145330.GA7321@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760137AbZBMPWH@vger.kernel.org>
In-Reply-To: <20090213145330.GA7321@orion>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: zbr@ioremap.net, gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Alexander Beregalov schrieb:
> drivers/staging/pohmelfs/inode.c:917: warning: format '%u' expects type 'unsigned int', but argument 4 has type 'size_t'
> drivers/staging/pohmelfs/inode.c:1036: warning: format '%u' expects type 'unsigned int', but argument 7 has type 'size_t'
> drivers/staging/pohmelfs/trans.c:164: warning: format '%u' expects type 'unsigned int', but argument 5 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:170: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:517: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:600: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:610: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
Signed-off-by: Frank Seidel <frank@f-seidel.de>
