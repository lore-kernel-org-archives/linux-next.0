From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: linux-next: Tree for Jun 19 (drm/i915)
Date: Tue, 24 Jun 2014 14:43:02 +0300
Message-ID: <87y4wm8reh.fsf@intel.com>
References: <20140619161632.58b442e4@canb.auug.org.au> <53A31CDA.20207@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59867 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752081AbaFXLnh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2014 07:43:37 -0400
In-Reply-To: <53A31CDA.20207@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Imre Deak <imre.deak@intel.com>

On Thu, 19 Jun 2014, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 06/18/14 23:16, Stephen Rothwell wrote:
>> Hi all,
>> 
>> The powerpc allyesconfig is again broken more than usual.
>> 
>> Changes since 20140618:
>> 
>
> on i386:
>
> CONFIG_ACPI is not enabled.
>
>   CC      drivers/gpu/drm/i915/i915_drv.o
> ../drivers/gpu/drm/i915/i915_drv.c: In function 'i915_drm_freeze':
> ../drivers/gpu/drm/i915/i915_drv.c:547:2: error: implicit declaration of function 'acpi_target_system_state' [-Werror=implicit-function-declaration]
> ../drivers/gpu/drm/i915/i915_drv.c:547:36: error: 'ACPI_STATE_S3' undeclared (first use in this function)
> ../drivers/gpu/drm/i915/i915_drv.c:547:36: note: each undeclared identifier is reported only once for each function it appears in
>   CC      net/dccp/qpolicy.o
> cc1: some warnings being treated as errors
> make[5]: *** [drivers/gpu/drm/i915/i915_drv.o] Error 1

Thanks for the report, we'll fix it.

Can anyone explain why include/linux/acpi_bus.h has #ifdef
CONFIG_ACPI_SLEEP and conditional build for a dummy inline version of
acpi_target_system_state(), *but* that does not get included or used if
CONFIG_ACPI=n? Additionally, the combination of CONFIG_ACPI=y and
CONFIG_ACPI_SLEEP=n does not seem to work at all.

So we'll really have to sprinkle #ifdef CONFIG_ACPI all over, instead of
neatly using the dummy versions that someone has gone through the
trouble of adding?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Technology Center
