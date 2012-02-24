From: Jeff Garzik <jeff@garzik.org>
Subject: Re: linux-next: build warning after merge of the libata tree
Date: Thu, 23 Feb 2012 23:06:11 -0500
Message-ID: <4F470CB3.2010800@garzik.org>
References: <20120213162740.9e3cb47a39da19ed89edea49@canb.auug.org.au> <20120224140814.c134151d30e3f32b36360d5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120224140814.c134151d30e3f32b36360d5d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>
List-Id: linux-next.vger.kernel.org

On 02/23/2012 10:08 PM, Stephen Rothwell wrote:
> Hi Jeff, Matthew,
>
> On Mon, 13 Feb 2012 16:27:40 +1100 Stephen Rothwell<sfr@canb.auug.org.au>  wrote:
>>
>> After merging the libata tree, today's linux-next build (powerpc
>> ppc64_defconfig) produced this warning:
>>
>> drivers/ata/libata.h:133:13: warning: 'ata_acpi_bind_dock' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:134:13: warning: 'ata_acpi_unbind_dock' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:132:13: warning: 'ata_acpi_unregister' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:132:13: warning: 'ata_acpi_unregister' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:133:13: warning: 'ata_acpi_bind_dock' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:134:13: warning: 'ata_acpi_unbind_dock' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:132:13: warning: 'ata_acpi_unregister' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:133:13: warning: 'ata_acpi_bind_dock' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:134:13: warning: 'ata_acpi_unbind_dock' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:132:13: warning: 'ata_acpi_unregister' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:133:13: warning: 'ata_acpi_bind_dock' defined but not used [-Wunused-function]
>> drivers/ata/libata.h:134:13: warning: 'ata_acpi_unbind_dock' defined but not used [-Wunused-function]
>>
>> Introduced by commits 75d22cd567ca ("libata: Bind the Linux device tree
>> to the ACPI device tree") and c9df614ade0e ("libata: Add links between
>> removable devices and docks").
>
> Ping?

A build fix and oops fix were both just pushed out.

	Jeff
