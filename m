From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kgdboc: Fix warning with module build
Date: Thu, 20 Sep 2018 09:16:52 +0200
Message-ID: <20180920071652.GA12843@kroah.com>
References: <20180919131208.07aa9c6b@canb.auug.org.au>
 <20180920015901.4639-1-labbott@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180920015901.4639-1-labbott@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <labbott@redhat.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Wed, Sep 19, 2018 at 06:59:01PM -0700, Laura Abbott wrote:
> 
> After 2dd453168643 ("kgdboc: Fix restrict error"), kgdboc_option_setup is
> now only used when built in, resulting in a warning when compiled as a
> module:
> 
> drivers/tty/serial/kgdboc.c:134:12: warning: 'kgdboc_option_setup' defined but not used [-Wunused-function]
>  static int kgdboc_option_setup(char *opt)
>             ^~~~~~~~~~~~~~~~~~~
> 
> Move the function under the appropriate ifdef for builtin only.
> 
> Fixes: 2dd453168643 ("kgdboc: Fix restrict error")
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
>  drivers/tty/serial/kgdboc.c | 37 +++++++++++++++++++------------------
>  1 file changed, 19 insertions(+), 18 deletions(-)

You forgot a reported-by: tag :(

I'll go fix it up, thanks for the patch resolving this.

greg k-h
