From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the edac-amd tree
Date: Mon, 01 Jun 2015 16:36:20 +0200
Message-ID: <5689037.BqsIAc2Shz@wuerfel>
References: <20150601170742.626210ef@canb.auug.org.au> <20150601095127.GA21881@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:49599 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752846AbbFAOgv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2015 10:36:51 -0400
In-Reply-To: <20150601095127.GA21881@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Loc Ho <lho@apm.com>

On Monday 01 June 2015 11:51:27 Borislav Petkov wrote:
> On Mon, Jun 01, 2015 at 05:07:42PM +1000, Stephen Rothwell wrote:
> > Hi Borislav,
> > 
> > After merging the edac-amd tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/edac/xgene_edac.c: In function 'xgene_edac_pmd_l2c_version1':
> > drivers/edac/xgene_edac.c:792:2: error: implicit declaration of function 'MIDR_VARIANT' [-Werror=implicit-function-declaration]
> >   switch (MIDR_VARIANT(read_cpuid_id())) {
> >   ^
> > drivers/edac/xgene_edac.c:792:2: error: implicit declaration of function 'read_cpuid_id' [-Werror=implicit-function-declaration]
> > drivers/edac/xgene_edac.c:794:3: error: implicit declaration of function 'MIDR_REVISION' [-Werror=implicit-function-declaration]
> >    switch (MIDR_REVISION(read_cpuid_id())) {
> >    ^
> > drivers/edac/xgene_edac.c:797:4: error: implicit declaration of function 'read_cpuid' [-Werror=implicit-function-declaration]
> >     switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
> >     ^
> > drivers/edac/xgene_edac.c:797:40: error: 'REVIDR_EL1' undeclared (first use in this function)
> >     switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
> >                                         ^
> > drivers/edac/xgene_edac.c:790:37: note: in definition of macro 'REVIDR_MINOR_REV'
> >   #define REVIDR_MINOR_REV(revidr) ((revidr) & 0x00000007)
> >                                      ^
> > drivers/edac/xgene_edac.c:797:40: note: each undeclared identifier is reported only once for each function it appears in
> >     switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
> >                                         ^
> > drivers/edac/xgene_edac.c:790:37: note: in definition of macro 'REVIDR_MINOR_REV'
> >   #define REVIDR_MINOR_REV(revidr) ((revidr) & 0x00000007)
> >                                      ^
> > 
> > Caused by commit  ("EDAC: Add APM X-Gene SoC EDAC driver").  You can't
> > use COMPIlE_TEST for drivers that use arch specific APIs ...
> 
> Yeah, the COMPIlE_TEST thing was not such a good idea, after all.
> 

At least it should have been tested.

Can we instead just kill the CPUID check? It has absolutely no business
in a device driver like this, and the driver should be made to build
fine on all architectures.

	Arnd
