From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: linux-next: Tree for Jan 26 (gpu/drm/i915/)
Date: Mon, 29 Jan 2018 10:45:06 +0200
Message-ID: <87o9ldkq99.fsf@intel.com>
References: <20180126135856.747be66b@canb.auug.org.au> <a44d975f-6514-c71c-e885-abf8764b93cd@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:24935 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751330AbeA2IpX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Jan 2018 03:45:23 -0500
In-Reply-To: <a44d975f-6514-c71c-e885-abf8764b93cd@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Fri, 26 Jan 2018, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 01/25/2018 06:58 PM, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20180119:
>> 
>
> on x86_64:
> drivers/gpu/drm/i915/intel_panel.o: In function `intel_backlight_device_register':
> intel_panel.c:(.text+0x28d4): undefined reference to `backlight_device_register'
> drivers/gpu/drm/i915/intel_panel.o: In function `intel_backlight_device_unregister':
> intel_panel.c:(.text+0x2991): undefined reference to `backlight_device_unregister'
>
> when CONFIG_BACKLIGHT_CLASS_DEVICE=m
> and CONFIG_DRM_I915=y

I don't deny there's an issue with i915 selecting
CONFIG_BACKLIGHT_CLASS_DEVICE. I'm afraid previous attempts at fixing
that have been a rabbit hole; new config errors pop up
elsewhere. [citation needed].

That said, I thought we had enough duct tape in the Kconfig to keep the
issues at bay. Since you're replying to linux-next, are you saying this
is new? I wonder if something's changed elsewhere.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Technology Center
