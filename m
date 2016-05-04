From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: [Xen-devel] efi_enabled(EFI_PARAVIRT) use
Date: Wed, 4 May 2016 12:36:13 +0100
Message-ID: <20160504113613.GG2839@codeblueprint.co.uk>
References: <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
 <20160429143931.GG2839@codeblueprint.co.uk>
 <CAKv+Gu_k45_r0mke6ELb3Pi05BnJiEMqweJRfsy7S55FzCpF7Q@mail.gmail.com>
 <5724BDD2.5020600@linaro.org>
 <20160430204420.GM2839@codeblueprint.co.uk>
 <572576E2.7060508@linaro.org>
 <20160501132620.GT2839@codeblueprint.co.uk>
 <57261483.10500@linaro.org>
 <20160502104530.GV2839@codeblueprint.co.uk>
 <572802B2.4020204@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:37582 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750781AbcEDLgQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 May 2016 07:36:16 -0400
Received: by mail-wm0-f48.google.com with SMTP id a17so88737698wme.0
        for <linux-next@vger.kernel.org>; Wed, 04 May 2016 04:36:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <572802B2.4020204@huawei.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Cc: Shannon Zhao <shannon.zhao@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Stefano Stabellini <sstabellini@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Peter Zijlstra <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, Borislav Petkov <bp@alien8.de>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>

On Tue, 03 May, at 09:45:22AM, Shannon Zhao wrote:
> > +static int __init fdt_find_uefi_params(unsigned long node, const char *uname,
> > +				       int depth, void *data)
> > +{
> > +	struct param_info *info = data;
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(dt_params); i++) {
> > +
> > +		if (depth != 1 || strcmp(uname, dt_params[i].uname) != 0) {
> > +			info->missing = dt_params[i].params[0].name;
> > +			continue;
> > +		}
> > +
> So here it needs to check whether the node is /hypervisor. If so, get
> the subnode "uefi". Like below:
> if (strcmp(uname, "hypervisor") == 0) {
> 	offset = of_get_flat_dt_subnode_by_name(node, "uefi");
> 	if (offset < 0)
> 		return 0;
> 	node = offset;
> }

Urgh, right.

How about giving dt_params a const char *subnode field and doing,

	for (i = 0; i < ARRAY_SIZE(dt_params); i++) {
		const char *subnode = dt_params[i].sub_node;

		if (depth != 1 || strcmp(uname, dt_params[i].uname) != 0) {
			info->missing = dt_params[i].params[0].name;
			continue;
		}

		if (subnode) {
			offset = of_get_flat_dt_subnode_by_name(node, subnode);
			if (offset < 0)
				return 0;
			node = offset;
		}

	...
