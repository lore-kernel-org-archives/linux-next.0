From: Jeff Garzik <jeff@garzik.org>
Subject: Re: linux-next: build warnings after merge of the libata tree
Date: Mon, 02 Jul 2012 02:11:52 -0400
Message-ID: <4FF13BA8.5010407@garzik.org>
References: <20120702131914.510857dc84182e95641e7e97@canb.auug.org.au> <1341199318.31272.2.camel@minggr> <20120702135429.0d17c1f4fe46828bd29b3458@canb.auug.org.au> <1341203479.31272.4.camel@minggr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:36369 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932148Ab2GBGLz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jul 2012 02:11:55 -0400
In-Reply-To: <1341203479.31272.4.camel@minggr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lin Ming <ming.m.lin@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Holger Macht <holger@homac.de>

On 07/02/2012 12:31 AM, Lin Ming wrote:
> diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
> index 44a7939..50e4dff 100644
> --- a/drivers/ata/libata.h
> +++ b/drivers/ata/libata.h
> @@ -131,9 +131,9 @@ static inline void ata_acpi_on_disable(struct ata_device *dev) { }
>   static inline void ata_acpi_set_state(struct ata_port *ap,
>   				      pm_message_t state) { }
>   static inline int ata_acpi_register(void) { return 0; }
> -static void ata_acpi_unregister(void) { }
> -static void ata_acpi_bind(struct ata_device *dev) { }
> -static void ata_acpi_unbind(struct ata_device *dev) { }
> +static inline void ata_acpi_unregister(void) { }
> +static inline void ata_acpi_bind(struct ata_device *dev) { }
> +static inline void ata_acpi_unbind(struct ata_device *dev) { }

applied (and #NEXT updated, of course)
