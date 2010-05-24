From: Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [PATCH -next] nouveau: fix acpi_lid_open undefined
Date: Mon, 24 May 2010 10:09:23 +1000
Message-ID: <1274659763.2385.24.camel@localhost.localdomain>
References: <20100522170459.4c89723d.sfr@canb.auug.org.au>
	 <20100523170040.3c4aa87c.randy.dunlap@oracle.com>
Reply-To: bskeggs@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49775 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755714Ab0EXAI6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 May 2010 20:08:58 -0400
In-Reply-To: <20100523170040.3c4aa87c.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>

On Sun, 2010-05-23 at 17:00 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> When CONFIG_ACPI_BUTTON=m (and probably when ACPI_BUTTON is not enabled)
> and NOUVEAU is built-in (not as a loadable module):
> 
> nouveau_connector.c:(.text+0xe17ce): undefined reference to `acpi_lid_open'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Acked-by: Ben Skeggs <bskeggs@redhat.com>

> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- linux-next-20100522.orig/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ linux-next-20100522/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -241,7 +241,8 @@ nouveau_connector_detect(struct drm_conn
>  	if (nv_encoder && nv_connector->native_mode) {
>  		unsigned status = connector_status_connected;
>  
> -#ifdef CONFIG_ACPI
> +#if defined(CONFIG_ACPI_BUTTON) || \
> +	(defined(CONFIG_ACPI_BUTTON_MODULE) && defined(MODULE))
>  		if (!nouveau_ignorelid && !acpi_lid_open())
>  			status = connector_status_unknown;
>  #endif
