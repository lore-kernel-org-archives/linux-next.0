From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure after merge of the moduleh tree
Date: Fri, 23 Mar 2012 08:49:31 -0400
Message-ID: <4F6C715B.2080104@windriver.com>
References: <20120323155114.a1779aa050fa05f6191b7dae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:51277 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751802Ab2CWMuA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Mar 2012 08:50:00 -0400
In-Reply-To: <20120323155114.a1779aa050fa05f6191b7dae@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Linus <torvalds@linux-foundation.org>

On 12-03-23 12:51 AM, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the moduleh tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/radeon/si_blit_shaders.c:252:1: error: implicit declaration of function 'BUILD_BUG_ON_ZERO' [-Werror=implicit-function-declaration]
> drivers/gpu/drm/radeon/si_blit_shaders.c:252:1: error: initializer element is not constant
> 
> Caused by commit 48c0c902e2e6 ("drm/radeon/kms: add support for CP setup
> on SI") from Linus' tree interacting with commit 6c03438edeb5 ("kernel.h:
> doesn't explicitly use bug.h, so don't include it").

Thanks Stephen,

Too bad the radeon commits weren't in linux-next, then we'd not
have to be fixing these in the merge window...

I think it makes sense for me to fold this into:

commit 50af5ead3b44ccf8bd2b4d2a50c1b610f557c480
Author: Paul Gortmaker <paul.gortmaker@windriver.com>
Date:   Fri Jan 20 18:35:53 2012 -0500

    bug.h: add include of it to various implicit C users

in the bug-3.4 tree before requesting it to be pulled.

Paul.
--

> 
> ARRAY_SIZE in kernel.h uses __must_be_array from compiler{-ggc,-intel}.h
> which uses BUILD_BUG_ON_ZERO ...  I don;t know if we want to include
> bug.h in compiler.h ...
> 
> So, for today, I have added the following patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 23 Mar 2012 15:47:07 +1100
> Subject: [PATCH] kernel.h: using ARRAY_SIZE needs to include bug.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/radeon/si_blit_shaders.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.c b/drivers/gpu/drm/radeon/si_blit_shaders.c
> index a7124b4..ec415e7 100644
> --- a/drivers/gpu/drm/radeon/si_blit_shaders.c
> +++ b/drivers/gpu/drm/radeon/si_blit_shaders.c
> @@ -25,6 +25,7 @@
>   */
>  
>  #include <linux/types.h>
> +#include <linux/bug.h>
>  #include <linux/kernel.h>
>  
>  const u32 si_default_state[] =
