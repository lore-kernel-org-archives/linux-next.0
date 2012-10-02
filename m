From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: linux-next: manual merge of the xen-two tree with Linus'
 tree
Date: Tue, 02 Oct 2012 12:37:16 +0100
Message-ID: <506AEE0C020000780009F0A1@nat28.tlf.novell.com>
References: <20121002141949.f6e61437bdce0d56d9d4321e@canb.auug.org.au>
 <alpine.DEB.2.02.1210021141370.29232@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1210021141370.29232@kaball.uk.xensource.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

>>> On 02.10.12 at 12:44, Stefano Stabellini <stefano.stabellini@eu.citrix.com> wrote:
>> --- a/drivers/xen/Makefile
>> +++ b/drivers/xen/Makefile
>> @@@ -4,8 -8,11 +8,12 @@@ obj-y	+= xenbus
>>   nostackp := $(call cc-option, -fno-stack-protector)
>>   CFLAGS_features.o			:= $(nostackp)
>>   
>> + obj-$(CONFIG_XEN_DOM0)			+= $(dom0-y)
>> + dom0-$(CONFIG_PCI) += pci.o
>> ++dom0-$(CONFIG_X86) += dbgp.o
>> + dom0-$(CONFIG_ACPI) += acpi.o
>> + dom0-$(CONFIG_X86) += pcpu.o
>>   obj-$(CONFIG_BLOCK)			+= biomerge.o
>> - obj-$(CONFIG_HOTPLUG_CPU)		+= cpu_hotplug.o
>>   obj-$(CONFIG_XEN_XENCOMM)		+= xencomm.o
>>   obj-$(CONFIG_XEN_BALLOON)		+= xen-balloon.o
>>   obj-$(CONFIG_XEN_SELFBALLOONING)	+= xen-selfballoon.o
>  
> 
> Considering that dbgp doesn't seem to be very useful without PCI at the
> moment, could we just turn it into:
> 
> dom0-$(CONFIG_PCI) += dbgp.o
> 
> ?

Better not - the code is specifically not PCI-only. And I can't see
how it would be harmful to be compiled on e.g. ARM (so the
merge perhaps really should use XEN_DOM0 alone, without
X86. If anything (and that may indeed be a minor oversight of
the original patch) one might want it to depend on USB_SUPPORT,
as without that no in-tree debug port capable driver would be
able to load (and hence interfere with Xen's use of the debug
port). However, as long as it builds fine with USB_SUPPORT
undefined (which I believe it does), having it in the shape it
is allows for out-of-tree drivers as well (as long as they make
use of the designated interface).

Jan
