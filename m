From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: manual merge of the cpufreq tree with the acpi tree
Date: Thu, 12 Nov 2009 12:13:56 -0500
Message-ID: <20091112171356.GC2447@redhat.com>
References: <20091112134524.d9854379.sfr@canb.auug.org.au>
 <200911120615.38067.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753597AbZKLRO0@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200911120615.38067.trenn@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Renninger <trenn@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhao Yakui <yakui.zhao@intel.com>, Len Brown <lenb@kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 12, 2009 at 06:15:37AM -0600, Thomas Renninger wrote:
 
 > > evaluation status to the platform") from the acpi tree and commit
 > > b02d803d0fa3a395ba32bc5e5e3e7a3385ca7237 ("[CPUFREQ] Introduce bios_limit
 > > per cpu cpufreq sysfs interface") from the cpufreq tree.
 > First, thanks everybody for picking this up.
 
np, apologies for the delay.

 > > By the way, Dave, Thomas, shouldn't the second version of
 > > acpi_processor_get_bios_limit() in include/acpi/processor.h introduced by
 > > the above cpufreq tree patch be "static inline"?
 > Yes, good catch.
 > Shall I send an on top fix somewhere?

Yeah, an incremental will be fine. I'll fold it into the original.

thanks,

	Dave
