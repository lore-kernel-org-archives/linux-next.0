From: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/i915: fix build errors when ACPI is not enabled
Date: Tue, 28 Jun 2016 14:07:19 +0300
Message-ID: <878txpshaw.fsf@intel.com>
References: <576EC660.3000806@infradead.org> <1467028399-9965-1-git-send-email-jani.nikula@intel.com> <20160628080604.GC25424@nuc-i3427.alporthouse.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160628080604.GC25424@nuc-i3427.alporthouse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, drm-intel-fixes@lists.freedesktop.org
List-Id: linux-next.vger.kernel.org

On Tue, 28 Jun 2016, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> On Mon, Jun 27, 2016 at 02:53:19PM +0300, Jani Nikula wrote:
>> From: Randy Dunlap <rdunlap@infradead.org>
>> 
>> Fix build errors when ACPI is not enabled by adding function stubs:
>> 
>> ../drivers/gpu/drm/i915/i915_drv.c: In function 'i915_drm_suspend':
>> ../drivers/gpu/drm/i915/i915_drv.c:635:2: error: implicit declaration of function 'intel_opregion_unregister' [-Werror=implicit-function-declaration]
>>   intel_opregion_unregister(dev_priv);
>> ../drivers/gpu/drm/i915/i915_drv.c: In function 'i915_drm_resume':
>> ../drivers/gpu/drm/i915/i915_drv.c:798:2: error: implicit declaration of function 'intel_opregion_register' [-Werror=implicit-function-declaration]
>>   intel_opregion_register(dev_priv);
>> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Fixes: 03d92e4779b8 ("drm/i915/opregion: Rename init/fini functions to register/unregister")
>> Cc: drm-intel-fixes@lists.freedesktop.org
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> [Jani: dropped the stale init/fini declarations]
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris

Pushed to drm-intel-next-queued, thanks for the patch and review.

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Technology Center
