From: Konrad Rzeszutek Wilk <konrad@darnok.org>
Subject: Re: linux-next: April 27 (iscsi_ibft)
Date: Tue, 11 May 2010 13:58:48 -0400
Message-ID: <201005111358.49290.konrad@darnok.org>
References: <80edf231-ef31-4f21-ab1b-1a21fda35809@default> <20100427230121.GA31743@andromeda.dapyr.net> <4BD85393.8020400@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4BD85393.8020400@oracle.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Konrad Rzeszutek Wilk <konrad@kernel.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, Peter Jones <pjones@redhat.com>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

> > It is all b/c we now use the 'struct acpi_table_ibft *ibft_addr' which
> > is gone when !CONFIG_ACPI.
> >
> > Peter, if we did in an #ifdef !CONFIG_ACPI in iscsi_ibft.h and included
> > a copy of the old ibft_struct that should work.
> >
> > Or we make the code dependent on CONFIG_ACPI (in the Kconfig
> > file).
> >
> > Peter, Randy: Which option do you think makes more sense?
>
> I think that you and Peter know more about that than I do.
> I'd go for the Kconfig dependency.

Found a way that makes this go away. This is by including #include 
<linux/iscsi_ibft.h> in the module and it fixed the problem.
