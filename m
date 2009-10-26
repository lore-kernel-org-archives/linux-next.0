From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH 9/9] pcmcia: remove pcmcia_get_{first,next}_tuple()
Date: Mon, 26 Oct 2009 15:19:58 -0700
Message-ID: <20091026151958.a2e7871b.randy.dunlap@oracle.com>
References: <1255907255-28297-1-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-2-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-3-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-4-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-5-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-6-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-7-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-8-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-9-git-send-email-linux@dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:52818 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753452AbZJZWZG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Oct 2009 18:25:06 -0400
In-Reply-To: <1255907255-28297-9-git-send-email-linux@dominikbrodowski.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>, devel@driverdev.osuosl.org
Cc: linux-pcmcia@lists.infradead.org, gregkh@suse.de, linux-next@vger.kernel.org

On Mon, 19 Oct 2009 01:07:35 +0200 Dominik Brodowski wrote:

> Remove the pcmcia_get_{first,next}_tuple() calls no longer needed by
> (current) pcmcia device drivers.

linux-next 20091026:

drivers/staging/comedi/drivers/cb_das16_cs.c:155: error: implicit declaration of function 'pcmcia_get_first_tuple'
drivers/staging/comedi/drivers/cb_das16_cs.c:156: error: implicit declaration of function 'pcmcia_get_tuple_data'
drivers/staging/comedi/drivers/cb_das16_cs.c:883: error: implicit declaration of function 'pcmcia_get_next_tuple'

There are also other comedi/ drivers that this randconfig didn't attempt
to build that are still using these same interfaces.



> Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
> ---
>  drivers/pcmcia/cs_internal.h |    9 +++++++++
>  include/pcmcia/ds.h          |   15 ---------------
>  2 files changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pcmcia/cs_internal.h b/drivers/pcmcia/cs_internal.h
> index 06a14c9..70432ca 100644
> --- a/drivers/pcmcia/cs_internal.h
> +++ b/drivers/pcmcia/cs_internal.h
> @@ -206,6 +206,15 @@ int pccard_loop_tuple(struct pcmcia_socket *s, unsigned int function,
>  					 cisparse_t *parse,
>  					 void *priv_data));
>  
> +int pccard_get_first_tuple(struct pcmcia_socket *s, unsigned int function,
> +			tuple_t *tuple);
> +
> +int pccard_get_next_tuple(struct pcmcia_socket *s, unsigned int function,
> +			tuple_t *tuple);
> +
> +int pccard_get_tuple_data(struct pcmcia_socket *s, tuple_t *tuple);
> +
> +
>  /* rsrc_mgr.c */
>  int pcmcia_validate_mem(struct pcmcia_socket *s);
>  struct resource *pcmcia_find_io_region(unsigned long base,
> diff --git a/include/pcmcia/ds.h b/include/pcmcia/ds.h
> index 2eb6e24..6c37d4e 100644
> --- a/include/pcmcia/ds.h
> +++ b/include/pcmcia/ds.h
> @@ -229,21 +229,6 @@ int pcmcia_reset_card(struct pcmcia_socket *skt);
>  int pcmcia_access_configuration_register(struct pcmcia_device *p_dev,
>  					 conf_reg_t *reg);
>  
> -/* deprecated -- do not use in drivers. */
> -int pccard_get_first_tuple(struct pcmcia_socket *s, unsigned int function,
> -			tuple_t *tuple);
> -#define pcmcia_get_first_tuple(p_dev, tuple) \
> -	pccard_get_first_tuple(p_dev->socket, p_dev->func, tuple)
> -
> -int pccard_get_next_tuple(struct pcmcia_socket *s, unsigned int function,
> -			tuple_t *tuple);
> -#define pcmcia_get_next_tuple(p_dev, tuple) \
> -	pccard_get_next_tuple(p_dev->socket, p_dev->func, tuple)
> -
> -int pccard_get_tuple_data(struct pcmcia_socket *s, tuple_t *tuple);
> -#define pcmcia_get_tuple_data(p_dev, tuple) \
> -	pccard_get_tuple_data(p_dev->socket, tuple)
> -
>  /* device configuration */
>  int pcmcia_request_io(struct pcmcia_device *p_dev, io_req_t *req);
>  int pcmcia_request_irq(struct pcmcia_device *p_dev, irq_req_t *req);
> -- 


---
~Randy
