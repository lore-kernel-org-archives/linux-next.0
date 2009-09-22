From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH v6] RO/NX protection for loadable kernel modules
Date: Tue, 22 Sep 2009 11:50:21 -0400
Message-ID: <817ecb6f0909220850m4127b382h12fafd1e6182a292@mail.gmail.com>
References: <817ecb6f0909101950v2fc6dc6u5cbc40cd9a9dde77@mail.gmail.com>
	 <200909220929.32301.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <200909220929.32301.rusty@rustcorp.com.au>
Sender: linux-security-module-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

> This is usually considered a bad idea. =A0Make a new config option,
> CONFIG_HAVE_SET_MEMORY_PROTECTION, select it in arch/x86/Kconfig.
> Then wrap the entire functions in one #ifdef CONFIG_HAVE_....
> and put empty versions in the #else.

Ok, will do.
--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
