From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 26 (gpu/drm/i915/)
Date: Fri, 26 Jan 2018 10:29:30 -0800
Message-ID: <a44d975f-6514-c71c-e885-abf8764b93cd@infradead.org>
References: <20180126135856.747be66b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43473 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751291AbeAZS3c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jan 2018 13:29:32 -0500
In-Reply-To: <20180126135856.747be66b@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On 01/25/2018 06:58 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180119:
> 

on x86_64:
drivers/gpu/drm/i915/intel_panel.o: In function `intel_backlight_device_register':
intel_panel.c:(.text+0x28d4): undefined reference to `backlight_device_register'
drivers/gpu/drm/i915/intel_panel.o: In function `intel_backlight_device_unregister':
intel_panel.c:(.text+0x2991): undefined reference to `backlight_device_unregister'

when CONFIG_BACKLIGHT_CLASS_DEVICE=m
and CONFIG_DRM_I915=y


-- 
~Randy
