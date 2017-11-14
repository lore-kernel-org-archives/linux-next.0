From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: build warning after merge of the bluetooth tree
Date: Tue, 14 Nov 2017 10:00:26 +0100
Message-ID: <d6d5041b-5cec-0205-62cb-fa468d41a6ea@redhat.com>
References: <20171114115633.1f4db312@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44754 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751466AbdKNJAa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Nov 2017 04:00:30 -0500
In-Reply-To: <20171114115633.1f4db312@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi,

On 14-11-17 01:56, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bluetooth tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
> 
> Introduced by commit
> 
>    86be3c232877 ("Bluetooth: btusb: Add a Kconfig option to enable USB autosuspend by default")
> 
> There is a missing close double quote ...

Ugh, sorry about that, a patch (on top of the original) fixing this
is coming up right away.

Regards,

Hans
