From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] nouveau: fix acpi_lid_open undefined
Date: Mon, 24 May 2010 07:17:21 -0700
Message-ID: <4BFA8A71.4080900@oracle.com>
References: <20100522170459.4c89723d.sfr@canb.auug.org.au>
	<20100523170040.3c4aa87c.randy.dunlap@oracle.com>
	<20100524125628.GA14278@srcf.ucam.org>
	<4BFA84EF.7070609@oracle.com>
	<20100524135940.GA15892@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20100524135940.GA15892@srcf.ucam.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: linux-next.vger.kernel.org

On 05/24/10 06:59, Matthew Garrett wrote:
> On Mon, May 24, 2010 at 06:53:51AM -0700, Randy Dunlap wrote:
>> On 05/24/10 05:56, Matthew Garrett wrote:
>>> Won't this result in a behavioural difference? The desirable outcome is 
>>
>> It could, yes.
>>
>>> that that configuration be impossible, not for that configuration to 
>>> build but be buggy.
>>
>> so nouveau should depend on (or select, if ACPI is enabled) ACPI_BUTTON?
> 
> There's an argument that it doesn't need to depend on it, but if button 
> is a module then nouveau has to be. Except the inverse isn't true. 
> Kconfig is hard, let's weep gently.

Maybe Dave can weep with us when he is back at work...


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
