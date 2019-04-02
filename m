From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] linux-next: Tree for Mar 29 (i915, no ACPI)
Date: Tue, 02 Apr 2019 15:29:09 +0300
Message-ID: <87zhp8zj3e.fsf@intel.com>
References: <20190329141831.30fd841f@canb.auug.org.au> <a7cf7fb9-c154-77b6-c63d-d71a12a1706b@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a7cf7fb9-c154-77b6-c63d-d71a12a1706b@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

On Fri, 29 Mar 2019, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 3/28/19 8:18 PM, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20190328:
>> 
>> The pidfd tree lost its build failures.
>> 
>
> on x86_64, when # CONFIG_ACPI is not set/enabled:
>
> ld: drivers/gpu/drm/i915/intel_panel.o: in function `intel_backlight_device_register':
> intel_panel.c:(.text+0x2c49): undefined reference to `backlight_device_register'
> ld: drivers/gpu/drm/i915/intel_panel.o: in function `intel_backlight_device_unregister':
> intel_panel.c:(.text+0x2d01): undefined reference to `backlight_device_unregister'
>
>
>
> Full randconfig file is attached.

# CONFIG_ACPI is not set
CONFIG_DRM_I915=y
CONFIG_BACKLIGHT_CLASS_DEVICE=m

drivers/gpu/drm/i915/Kconfig:

config DRM_I915
	# ...
	select BACKLIGHT_CLASS_DEVICE if ACPI

The above pretty much sums it up. It's been reported before, the
earliest I could find was [1].

I've previously suggested patches that would make backlight a dependency
instead of selecting it, in line with [2]. However we can't do that in
i915 alone without recursive dependencies, and changing all backlight
users was met with opposition because "select is convenient".

Maybe I'll look at this one of these days, but don't hold your breath.


BR,
Jani.


[1] http://mid.mail-archive.com/CA+r1ZhhmT4DrWtf6MbRQo5EqXwx+LxCqh15Vsu_d9WpftLhnxw@mail.gmail.com

[2] Documentation/kbuild/kconfig-language.txt "In general use select
    only for non-visible symbols (no prompts anywhere) and for symbols
    with no dependencies."

-- 
Jani Nikula, Intel Open Source Graphics Center
