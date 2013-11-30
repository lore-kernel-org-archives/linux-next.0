From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 29 (i915/intel_opregion)
Date: Fri, 29 Nov 2013 17:56:57 -0800
Message-ID: <529945E9.303@infradead.org>
References: <20131129134535.f886fbf966dcfea00178a1b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131129134535.f886fbf966dcfea00178a1b7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>
List-Id: linux-next.vger.kernel.org

On 11/28/13 18:45, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20131128:
> 

on x86_64:

CONFIG_ACPI is not enabled.


  CC      drivers/gpu/drm/i915/intel_opregion.o
In file included from drivers/gpu/drm/i915/intel_opregion.c:31:0:
include/linux/acpi_io.h:7:45: error: unknown type name 'acpi_physical_address'
include/linux/acpi_io.h:8:10: error: unknown type name 'acpi_size'
include/linux/acpi_io.h:13:33: error: unknown type name 'acpi_physical_address'
include/linux/acpi_io.h:15:40: warning: 'struct acpi_generic_address' declared inside parameter list [enabled by default]
include/linux/acpi_io.h:15:40: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/acpi_io.h:16:43: warning: 'struct acpi_generic_address' declared inside parameter list [enabled by default]
drivers/gpu/drm/i915/intel_opregion.c: In function 'intel_opregion_setup':
drivers/gpu/drm/i915/intel_opregion.c:866:2: error: implicit declaration of function 'acpi_os_ioremap' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_opregion.c:866:7: warning: assignment makes pointer from integer without a cast [enabled by default]
cc1: some warnings being treated as errors
make[5]: *** [drivers/gpu/drm/i915/intel_opregion.o] Error 1


-- 
~Randy
