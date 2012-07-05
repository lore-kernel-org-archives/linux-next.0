From: Yoder Stuart-B08248 <B08248@freescale.com>
Subject: RE: linux-next: build failure after merge of the kvm-ppc tree
Date: Thu, 5 Jul 2012 14:20:18 +0000
Message-ID: <9F6FE96B71CF29479FF1CDC8046E150339A388@039-SN1MPN1-002.039d.mgd.msft.net>
References: <20120705154929.219789032ef59f9243d0b8a5@canb.auug.org.au>
 <92A87EB2-E859-456C-85DE-7F0A4CC5F127@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <92A87EB2-E859-456C-85DE-7F0A4CC5F127@suse.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Alexander Graf <agraf@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Alexander Graf [mailto:agraf@suse.de]
> Sent: Thursday, July 05, 2012 1:03 AM
> To: Stephen Rothwell
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Yoder Stuart-B08248; ppc-dev
> Subject: Re: linux-next: build failure after merge of the kvm-ppc tree
> 
> 
> On 05.07.2012, at 07:49, Stephen Rothwell wrote:
> 
> > Hi Alexander,
> >
> > After merging the kvm-ppc tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > arch/powerpc/kernel/exceptions-64s.S: Assembler messages:
> > arch/powerpc/kernel/exceptions-64s.S:479: Error: wrong number of operands
> > arch/powerpc/kernel/exceptions-64s.S:486: Error: wrong number of operands
> > arch/powerpc/kernel/exceptions-64s.S:486: Error: wrong number of operands
> > arch/powerpc/kernel/exceptions-64s.S:487: Error: wrong number of operands
> > arch/powerpc/kernel/exceptions-64s.S:487: Error: wrong number of operands
> > arch/powerpc/kernel/exceptions-64s.S:494: Error: wrong number of operands
> > arch/powerpc/kernel/exceptions-64s.S:494: Error: wrong number of operands
> >
> > Caused by commit bc8cc4993e19 ("PPC: use CURRENT_THREAD_INFO instead of
> > open coded assembly").  The fact that this patch has problems was already
> > pointed out on the linuxppc-dev mailing list and it clearly hasn't been
> > build tested.
> >
> > I have used the version of the kvm-ppc tree from next-20120703 for today.
> 
> Ah, yes, thanks. I kept the old, broken version in my tree to make sure I have the dependencies for (and
> don't forget) the (hopefully good) patches that follow on top, but was planning to replace it once we
> have a new version of the CURRENT_THREAD_INFO one.
> 
> Stuart, could you please send a new version of the CURRENT_THREAD_INFO patch?

Yes, will send that shortly.

Stuart
