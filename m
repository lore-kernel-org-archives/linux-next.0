From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: randconfig build error with next-20141001,
	in drivers/gpu/drm/i915
Date: Wed, 01 Oct 2014 11:23:47 -0700
Message-ID: <542C46B3.2020901@infradead.org>
References: <CA+r1ZhhmT4DrWtf6MbRQo5EqXwx+LxCqh15Vsu_d9WpftLhnxw@mail.gmail.com>
 <87fvf73c6g.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <87fvf73c6g.fsf@intel.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

On 10/01/14 10:57, Jani Nikula wrote:
> On Wed, 01 Oct 2014, Jim Davis <jim.epost@gmail.com> wrote:
>> Building with the attached random configuration file,
>>
>> warning: (VIDEO_TIMBERDALE) selects TIMB_DMA which has unmet direct
>> dependencies (DMADEVICES && MFD_TIMBERDALE)
>> warning: (USB_OTG_FSM && FSL_USB2_OTG && USB_MV_OTG) selects USB_OTG
>> which has unmet direct dependencies (USB_SUPPORT && USB && PM_RUNTIME)
>>
>> drivers/built-in.o: In function `intel_panel_setup_backlight':
>> (.text+0x11855d): undefined reference to `backlight_device_register'
>> drivers/built-in.o: In function `intel_panel_destroy_backlight':
>> (.text+0x118624): undefined reference to `backlight_device_unregister'
>> make: *** [vmlinux] Error 1
> 
> It's the combination:
> 
>> CONFIG_DRM_I915=y
>> CONFIG_BACKLIGHT_CLASS_DEVICE=m
> 
> Not sure what the Kconfig magic spell needs to be when we don't want to
> depend on CONFIG_BACKLIGHT_CLASS_DEVICE but we'll use it if it's enabled
> (y or m).

Something like:

	depends on BACKLIGHT_CLASS_DEVICE || BACKLIGHT_CLASS_DEVICE=n

is what we usually use.


-- 
~Randy
