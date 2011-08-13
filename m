From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: [PATCH][-next] acpi/acpi_drivers.h: fix warnings when ACPI_DOCK
 is not enabled
Date: Fri, 12 Aug 2011 20:23:42 -0400
Message-ID: <CACqU3MWrPZQL476R5uhOWrkjKNpUqHbX0oX7rB_yYbt8mz0kFQ@mail.gmail.com>
References: <1311957278-12290-1-git-send-email-lacombar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:42632 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751817Ab1HMAXn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Aug 2011 20:23:43 -0400
In-Reply-To: <1311957278-12290-1-git-send-email-lacombar@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, Vasiliy Kulikov <segoon@openwall.com>, Jeff Garzik <jgarzik@redhat.com>, Len Brown <len.brown@intel.com>

Hi,

On Fri, Jul 29, 2011 at 12:34 PM, Arnaud Lacombe <lacombar@gmail.com> w=
rote:
> /src/linux/linux/drivers/ata/libata-acpi.c: In function 'ata_acpi_ass=
ociate':
> /src/linux/linux/drivers/ata/libata-acpi.c:266:11: warning: passing a=
rgument 2 of 'register_hotplug_dock_device' discards 'const' qualifier =
from pointer target type [enabled by default]
> /src/linux/linux/include/acpi/acpi_drivers.h:146:19: note: expected '=
struct acpi_dock_ops *' but argument is of type 'const struct acpi_dock=
_ops *'
> /src/linux/linux/drivers/ata/libata-acpi.c:275:11: warning: passing a=
rgument 2 of 'register_hotplug_dock_device' discards 'const' qualifier =
from pointer target type [enabled by default]
> /src/linux/linux/include/acpi/acpi_drivers.h:146:19: note: expected '=
struct acpi_dock_ops *' but argument is of type 'const struct acpi_dock=
_ops *'
>
ping ? next-20110811 is still bad.

 - Arnaud

> Cc: Vasiliy Kulikov <segoon@openwall.com>
> Cc: Jeff Garzik <jgarzik@redhat.com>
> Cc: Len Brown <len.brown@intel.com>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
> =A0include/acpi/acpi_drivers.h | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/include/acpi/acpi_drivers.h b/include/acpi/acpi_drivers.=
h
> index e49c36d..bb145e4 100644
> --- a/include/acpi/acpi_drivers.h
> +++ b/include/acpi/acpi_drivers.h
> @@ -144,7 +144,7 @@ static inline void unregister_dock_notifier(struc=
t notifier_block *nb)
> =A0{
> =A0}
> =A0static inline int register_hotplug_dock_device(acpi_handle handle,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0struct acpi_dock_ops *ops,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0const struct acpi_dock_ops *ops,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0return -ENODEV;
> --
> 1.7.6.153.g78432
>
>
