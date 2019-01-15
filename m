From: Sinan Kaya <okaya@kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the pm tree
Date: Tue, 15 Jan 2019 16:10:07 -0500
Message-ID: <0f64417d-be5e-2939-7fc5-ee5ba26c64a6@kernel.org>
References: <20190116075540.78cff44e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116075540.78cff44e@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 1/15/2019 3:55 PM, Stephen Rothwell wrote:
> [I am experimenting with checking the Fixes tags in commits in linux-next.
> Please let me know if you think I am being too strict.]
> 
> Hi Rafael,
> 
> Commits
> 
>    62b33d57c534 ("drivers: thermal: int340x_thermal: Make PCI dependency explicit")
>    cd793ab22a93 ("x86/intel/lpss: Make PCI dependency explicit")
>    42ac19e7b81e ("ACPI: EC: Look for ECDT EC after calling acpi_load_tables()")
>    6c29b81b5695 ("platform/x86: apple-gmux: Make PCI dependency explicit")
>    34783dc0182a ("platform/x86: intel_pmc: Make PCI dependency explicit")
>    704658d1d3ae ("platform/x86: intel_ips: make PCI dependency explicit")
>    5df37f3a1aa9 ("vga-switcheroo: make PCI dependency explicit")
>    da1df6ee4296 ("ata: pata_acpi: Make PCI dependency explicit")
>    ce97a22a596b ("ACPI / LPSS: Make PCI dependency explicit")
> 
> Have malformed Fixes tags:
> 
> There should be double quotes around the commit subject.
> 

Interesting, can you add this to the checkpatch.pl script so that it doesn't
happen again?
