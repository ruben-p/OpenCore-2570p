/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140424-64 [Jun 25 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of DSDT.aml, Wed Aug 19 16:07:28 2020
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00022D43 (142659)
 *     Revision         0x02
 *     Checksum         0xE1
 *     OEM ID           "HPQOEM"
 *     OEM Table ID     "17DF    "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20110112 (537985298)
 */
DefinitionBlock ("DSDT.aml", "DSDT", 2, "HPQOEM", "17DF    ", 0x00000001)
{
    /*
     * iASL Warning: There were 2 external control methods found during
     * disassembly, but only 0 was resolved (2 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods.
     *
     * If necessary, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (FPED, MethodObj)    // Warning: Unresolved method, guessing 0 arguments
    External (WMAB, MethodObj)    // Warning: Unresolved method, guessing 1 arguments

    External (_PR_.CPPC, IntObj)
    External (_PR_.CPU0._PPC, IntObj)
    External (_PR_.CPU0._PSS, IntObj)
    External (_SB_.IFFS.FFRU, UnknownObj)
    External (CFGD, UnknownObj)
    External (PDC0, UnknownObj)
    External (PDC1, UnknownObj)
    External (PDC2, UnknownObj)
    External (PDC3, UnknownObj)
    External (PDC4, UnknownObj)
    External (PDC5, UnknownObj)
    External (PDC6, UnknownObj)
    External (PDC7, UnknownObj)

    Name (FMBL, 0x01)
    Name (LSTA, 0x00)
    Name (IDPM, 0x00)
    Method (\HPTS, 1, NotSerialized)
    {
        Store (Arg0, SLPT) /* \SLPT */
        \_SB.ODGW (Or (0x5400, Arg0))
        If (CondRefOf (\_SB.IFFS.FFRU))
        {
            Store (0x00, \_SB.IFFS.FFRU) /* External reference */
        }

        If (LEqual (Arg0, 0x05))
        {
            \_SB.SSMI (0xEA82, Arg0, 0x00, 0x00, 0x00)
        }

        If (LGreater (Arg0, 0x00))
        {
            \_SB.SSMI (0xEA83, 0x00, 0x00, 0x00, 0x00)
            Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
            If (\_SB.PCI0.LPCB.EC0.ECRG)
            {
                Store (0x00, \_SB.PCI0.LPCB.EC0.HSST)
            }

            Release (\_SB.PCI0.LPCB.EC0.ECMX)
            PPTS (Arg0)
            If (LNotEqual (Arg0, 0x05))
            {
                \_SB.PCI0.LPCB.EC0.BTDR (0x00)
                Store (0xFF, \_SB.PCI0.LPCB.EC0.NGBF)
                Store (0xFF, \_SB.PCI0.LPCB.EC0.NGBT)
                Store (0x07, \_SB.PCI0.LPCB.EC0.GACP)
                Store (0x01, \_SB.NFBS)
                If (LEqual (Arg0, 0x03))
                {
                    Store (\_SB.LID._LID (), LSTA) /* \LSTA */
                    If (LNotEqual (And (PNHM, 0x000F0FF0), 0x000106E0))
                    {
                        Store (\APMC, IDPM) /* \IDPM */
                    }
                }

                If (LEqual (Arg0, 0x04))
                {
                    \_SB.WLBU.INIT ()
                }
            }
        }
    }

    Method (\HWAK, 1, NotSerialized)
    {
        Store (0x00, SLPT) /* \SLPT */
        \_SB.ODGW (Or (0x5600, Arg0))
        If (LEqual (Arg0, 0x03))
        {
            \_SB.SSMI (0xEA80, 0x00, 0x00, 0x00, 0x00)
        }

        \_SB.PCI0.LPCB.EC0.ITLB ()
        \_SB.PCI0.LPCB.EC0.RPPC (0x01)
        If (\_SB.PCI0.LPCB.EC0.ECRG)
        {
            Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
            Store (0x01, \_SB.PCI0.LPCB.EC0.ACPI)
            Store (0x00, \_SB.PCI0.LPCB.EC0.SLPT)
            Store (\WCOS (), \_SB.PCI0.LPCB.EC0.OST)
            Release (\_SB.PCI0.LPCB.EC0.ECMX)
        }

        If (LGreater (Arg0, 0x02))
        {
            
            
            Store (0x01, \_SB.NFBS)
            If (LEqual (Arg0, 0x03))
            {
                If (CondRefOf (\_SB.IFFS.FFRU))
                {
                    Notify (\_SB.SLPB, 0x02) // Device Wake
                }

                Store (\_SB.LID._LID (), Local0)
                If (XOr (Local0, LSTA))
                {
                    \_SB.PCI0.IGPU.GLID (Local0)
                }

                If (LNotEqual (And (PNHM, 0x000F0FF0), 0x000106E0))
                {
                    Store (IDPM, \APMC)
                }
            }

            If (LEqual (Arg0, 0x04))
            {

            }
        }

        If (LOr (LEqual (Arg0, 0x04), LEqual (\WCOS (), 0x01)))
        {
            Notify (\_SB.SLPB, 0x02) // Device Wake
        }

        Store (\_SB.PCI0.LPCB.EC0.GACS (), Local2)
        \_SB.PCI0.LPCB.EC0.PWUP (0x03, 0xFF)
        Store (\_SB.PCI0.LPCB.EC0.GBAP (), Local1)
        Store (\_SB.PCI0.LPCB.EC0.GACS (), Local3)
        Store (Local3, PWRS) /* \PWRS */
        XOr (Local2, Local3, Local3)
        If (LGreater (Arg0, 0x02))
        {
            Notify (\_SB.ADP1, 0x80) // Status Change
            PCNT ()
        }

        If (LEqual (Local3, 0x00))
        {
            If (LEqual (Arg0, 0x04))
            {
                XOr (Local2, 0x01, \_SB.ACST)
            }
        }

        PWAK (Arg0)
        \_SB.VWAK (Arg0)
        Store (\_SB.HST1.GHID (), Local0)
        \_SB.PCI0.ACEL.ITAL ()
    }

    Method (PCNT, 0, Serialized)
    {
        
        // nothing

    }

    Mutex (MUTX, 0x00)
    Method (P8XH, 2, Serialized)
    {
        If (LEqual (Arg0, 0x00))
        {
            \_SB.ODBG (Arg1)
            Store (Or (And (P80D, 0xFFFFFF00), Arg1), P80D) /* \P80D */
        }

        If (LEqual (Arg0, 0x01))
        {
            \_SB.ODG1 (Arg1)
            Store (Or (And (P80D, 0xFFFF00FF), ShiftLeft (Arg1, 0x08)
                ), P80D) /* \P80D */
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Or (And (P80D, 0xFF00FFFF), ShiftLeft (Arg1, 0x10)
                ), P80D) /* \P80D */
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Or (And (P80D, 0x00FFFFFF), ShiftLeft (Arg1, 0x18)
                ), P80D) /* \P80D */
        }
    }

    OperationRegion (SPRT, SystemIO, 0xB2, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    Method (\_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, GPIC) /* \GPIC */
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (LEqual (Arg0, 0x05)) {}
    Else
    {
HPTS (Arg0)
        If (LEqual (Arg0, 0x03))
        {
            If (LAnd (DTSE, LGreater (TCNT, 0x01)))
            {
                TRAP (0x02, 0x1E)
            }
        }

        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x05)))
        {
            If (LEqual (XHCI, 0x02))
            {
                Store (0xFFFFFFF0, Local0)
                And (Local0, \_SB.PCI0.XHC.PR3, \_SB.PCI0.XHC.PR3)
            }
        }    }

    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (LOr(LLess(Arg0,1),LGreater(Arg0,5))) { Store(3,Arg0) }
HWAK (Arg0)
        \_SB.PCI0.POSC (OSCC, 0x00)
        If (LEqual (Arg0, 0x03)) {}
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (LAnd (DTSE, LGreater (TCNT, 0x01)))
            {
                TRAP (0x02, 0x14)
            }

            If (CondRefOf(CFGD))
{
If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LAnd (LEqual (OSYS, 0x07D1), 
                    LNot (And (PDC0, 0x10)))))
                {
                    TRAP (0x01, 0x48)
                }
            }
}


            If (LEqual (OSYS, 0x07D2))
            {
                If (And (CFGD, 0x01))
                {
                    If (LGreater (\_PR.CPU0._PPC, 0x00))
                    {
                        Subtract (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC) /* External reference */
                        PNOT ()
                        Add (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC) /* External reference */
                        PNOT ()
                    }
                    Else
                    {
                        Add (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC) /* External reference */
                        PNOT ()
                        Subtract (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC) /* External reference */
                        PNOT ()
                    }
                }
            }
        }

        Return (Package (0x02)
        {
            0x00, 
            0x00
        })
    }

    Method (GETB, 3, Serialized)
    {
        Multiply (Arg0, 0x08, Local0)
        Multiply (Arg1, 0x08, Local1)
        CreateField (Arg2, Local0, Local1, TBF3)
        Return (TBF3) /* \GETB.TBF3 */
    }

    Method (PNOT, 0, Serialized)
    {
        
        // nothing

    }

    Method (TRAP, 2, Serialized)
    {
        Store (Arg1, SMIF) /* \SMIF */
        If (LEqual (Arg0, 0x01))
        {
            Store (0x00, TRP0) /* \TRP0 */
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Arg1, DTSF) /* \DTSF */
            Store (0x00, TRPD) /* \TRPD */
            Return (DTSF) /* \DTSF */
        }

        Return (SMIF) /* \SMIF */
    }

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            
            // always store 0x07D6 for "Darwin"
            Store (0x07D6, OSYS)
            //\_TZ.BOTT ()
            //\_TZ.RETD ()
            Store (One, PFLV)

        }
        
    }

    OperationRegion (GNVS, SystemMemory, 0xB9F69918, 0x01C6)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
        THOF,   8, 
        ACT1,   8, 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        Offset (0x25), 
        REVN,   8, 
        RES3,   8, 
        Offset (0x28), 
        APIC,   8, 
        TCNT,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
        C67L,   8, 
        NATP,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
        CMCP,   8, 
        CIRP,   8, 
        SMSC,   8, 
        W381,   8, 
        SMC1,   8, 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        KSV0,   32, 
        KSV1,   8, 
        Offset (0x62), 
        DCLK,   16, 
        FSBF,   16, 
        Offset (0x67), 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
        Offset (0x6E), 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
        Offset (0x74), 
        MEFE,   8, 
        DSTS,   8, 
        Offset (0x78), 
        TPMP,   8, 
        TPME,   8, 
        MORD,   8, 
        TCGP,   8, 
        PPRP,   32, 
        PPRQ,   8, 
        LPPR,   8, 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
        BID,    8, 
        PLID,   8, 
        Offset (0xAA), 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IPCF,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        PAVP,   8, 
        Offset (0xE1), 
        OSCC,   8, 
        NEXP,   8, 
        SBV1,   8, 
        SBV2,   8, 
        Offset (0xEB), 
        DSEN,   8, 
        ECON,   8, 
        GPIC,   8, 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8, 
        VFN2,   8, 
        VFN3,   8, 
        VFN4,   8, 
        Offset (0x100), 
        NVGA,   32, 
        NVHA,   32, 
        AMDA,   32, 
        DID6,   32, 
        DID7,   32, 
        DID8,   32, 
        EBAS,   32, 
        CPSP,   32, 
        EECP,   32, 
        EVCP,   32, 
        XBAS,   32, 
        OBS1,   32, 
        OBS2,   32, 
        OBS3,   32, 
        OBS4,   32, 
        OBS5,   32, 
        OBS6,   32, 
        OBS7,   32, 
        OBS8,   32, 
        Offset (0x157), 
        ATMC,   8, 
        PTMC,   8, 
        ATRA,   8, 
        PTRA,   8, 
        PNHM,   32, 
        TBAB,   32, 
        TBAH,   32, 
        RTIP,   8, 
        TSOD,   8, 
        ATPC,   8, 
        PTPC,   8, 
        PFLV,   8, 
        BREV,   8, 
        SGMD,   8, 
        SGFL,   8, 
        PWOK,   8, 
        HLRS,   8, 
        DSEL,   8, 
        ESEL,   8, 
        PSEL,   8, 
        PWEN,   8, 
        PRST,   8, 
        MXD1,   32, 
        MXD2,   32, 
        MXD3,   32, 
        MXD4,   32, 
        MXD5,   32, 
        MXD6,   32, 
        MXD7,   32, 
        MXD8,   32, 
        GBAS,   16, 
        SGGP,   8, 
        Offset (0x19D), 
        ALFP,   8, 
        IMON,   8, 
        PDTS,   8, 
        PKGA,   8, 
        PAMT,   8, 
        AC0F,   8, 
        AC1F,   8, 
        DTS3,   8, 
        DTS4,   8, 
        Offset (0x1B2), 
        XHCI,   8, 
        XHPM,   8, 
        Offset (0x1B7), 
        XTUB,   32, 
        XTUS,   32, 
        XMPB,   32, 
        Offset (0x1C4), 
        LPMV,   8, 
        MM64,   8
    }

    OperationRegion (ASMA, SystemMemory, 0xB9F6B018, 0x1060)
    Field (ASMA, AnyAcc, NoLock, Preserve)
    {
        ASMB,   33536
    }

    OperationRegion (AF10, SystemMemory, 0xB9F6D018, 0x0DB6)
    Field (AF10, AnyAcc, Lock, Preserve)
    {
        STAT,   32, 
        EVAL,   8, 
        ASTL,   8, 
        ASTG,   256, 
        OWNT,   640, 
        PROD,   640, 
        MODL,   640, 
        PTYP,   640, 
        PFRQ,   640, 
        MEMS,   640, 
        DATE,   640, 
        FAMI,   640, 
        SERL,   640, 
        VREV,   640, 
        VRE2,   640, 
        KBCD,   640, 
        HDDS,   160, 
        HDDM,   320, 
        CDAT,   136, 
        CSTS,   8, 
        CYCL,   8, 
        PBSN,   144, 
        SBSN,   144, 
        BSTS,   8, 
        BORD,   64, 
        APST,   8, 
        OAPW,   3200, 
        NAPW,   3200, 
        SECO,   32, 
        SECS,   32, 
        SKUN,   128, 
        SVID,   80, 
        SSID,   32, 
        BTFC,   160, 
        WLFC,   160, 
        WWFC,   160, 
        GPFC,   160, 
        UUID,   256, 
        CFID,   208, 
        PWDL,   16, 
        USRN,   264, 
        ROLE,   32, 
        CMDV,   32, 
        KBDL,   32, 
        HASH,   160, 
        SPSF,   8, 
        FMOD,   8, 
        NBDL,   8, 
        MBDL,   8, 
        NBAD,   8, 
        MBAD,   8, 
        WUFI,   80, 
        LFND,   1296, 
        ATIM,   48, 
        PCID,   512, 
        PCVR,   40, 
        CURL,   1040, 
        FWSF,   32, 
        FCM,    32, 
        MPMC,   8, 
        SBCT,   120, 
        MSDM,   800, 
        CPRV,   120, 
        PLFN,   320, 
        SNMD,   8, 
        PSSA,   8, 
        PSCF,   8, 
        BCIE,   8, 
        BCSC,   8, 
        HVER,   256, 
        HVCH,   512, 
        MMS1,   640, 
        MMS2,   640, 
        MMS3,   640, 
        MMS4,   640, 
        NMMS,   8, 
        CUBT,   480, 
        FBID,   1600, 
        ETOD,   88, 
        MACA,   144, 
        BHDS,   168, 
        BHDM,   328, 
        BHDZ,   72
    }

    OperationRegion (HPDF, SystemMemory, 0xB9F6EE18, 0x017D)
    Field (HPDF, AnyAcc, Lock, Preserve)
    {
        SLPT,   4, 
        WHOS,   4, 
        SDFG,   4, 
        LEGF,   1, 
        KCDB,   1, 
        KLDB,   1, 
        TPMX,   1, 
        FOAL,   1, 
        AEDA,   1, 
        ALSF,   1, 
        WOLD,   1, 
        HSED,   1, 
        HDEN,   1, 
        MDEN,   1, 
        ICPT,   1, 
        PMCS,   1, 
        UWKD,   1, 
        ILUX,   1, 
        ITPS,   1, 
        FCIN,   1, 
        ASFG,   3, 
        WDPE,   8, 
        WDSA,   16, 
        WDST,   16, 
        WDGN,   16, 
        WDSS,   16, 
        WLBN,   8, 
        PRDT,   8, 
        LPDP,   16, 
        EAX,    32, 
        EBX,    32, 
        ECX,    32, 
        EDX,    32, 
        REFS,   32, 
        SSCI,   8, 
        SBFC,   8, 
        TJMX,   8, 
        TRCN,   8, 
        DCAP,   8, 
        LOTR,   160, 
        HITR,   160, 
        WABN,   8, 
        WADN,   8, 
        WAFN,   8, 
        DTCD,   32, 
        BDCP,   8, 
        TBRB,   32, 
        OHCB,   32, 
        EDID,   2048, 
        ESTA,   8, 
        VRMS,   32, 
        VRMB,   32, 
        SGME,   8, 
        AMNS,   32, 
        AMNP,   32, 
        AMVS,   32, 
        AMVP,   32, 
        TBOD,   8
    }

    OperationRegion (HPD2, SystemMemory, 0xB9C35F18, 0x006D)
    Field (HPD2, AnyAcc, Lock, Preserve)
    {
        CFPS,   8, 
        CMDS,   8, 
        BRID,   8, 
        F11,    1, 
        RSVD,   31, 
        WLDA,   768, 
        WLFL,   8, 
        WLIX,   8, 
        BTIX,   8, 
        WWIX,   8, 
        W2IX,   8, 
        GPSI,   8
    }

    OperationRegion (HPBR, SystemMemory, 0xB9F6AF18, 0x007E)
    Field (HPBR, AnyAcc, Lock, Preserve)
    {
        PAID,   32, 
        PHSZ,   8, 
        PVSZ,   8, 
        BRCT,   8, 
        BCCT,   8, 
        BMAP,   88, 
        BCLV,   216, 
        BRLV,   200, 
        BRNT,   400, 
        BPWG,   16, 
        BPWO,   16, 
        PNLF,   8
    }

    Scope (\_GPE)
    {
        Method (_L01, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Add (L01C, 0x01, L01C) /* \L01C */
            \_SB.PCI0.RP01.HPLG ()
            \_SB.PCI0.RP02.HPLG ()
            \_SB.PCI0.RP03.HPLG ()
            \_SB.PCI0.RP04.HPLG ()
            \_SB.PCI0.RP05.HPLG ()
            \_SB.PCI0.RP06.HPLG ()
            \_SB.PCI0.RP07.HPLG ()
            \_SB.PCI0.RP08.HPLG ()
        }

        Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (0x00, GPEC) /* \GPEC */
            Store (SSCI, Local0)
            If (Local0)
            {
                Store (0x00, SSCI) /* \SSCI */
                If (LEqual (Local0, 0x01))
                {
                    VFN4 ()
                }

                If (LEqual (Local0, 0x04))
                {

                }

                If (LEqual (Local0, 0x05))
                {
                    If (\_SB.WLBU._STA ())
                    {
                        Notify (\_SB.WLBU, 0x80) // Status Change
                    }
                    Else
                    {

                    }
                }

                If (LEqual (Local0, 0x03))
                {
                    VBRE (0x87)
                }

                If (LEqual (Local0, 0x02))
                {
                    VBRE (0x86)
                }
            }
        }

        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            \_SB.PCI0.RP01.PME ()
            \_SB.PCI0.RP02.PME ()
            \_SB.PCI0.RP03.PME ()
            \_SB.PCI0.RP04.PME ()
            \_SB.PCI0.RP05.PME ()
            \_SB.PCI0.RP06.PME ()
            \_SB.PCI0.RP07.PME ()
            \_SB.PCI0.RP08.PME ()
        }

        Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.PCIB, 0x02) // Device Wake
        }

        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (\_SB.PCI0.EH01.PMES)
            {
                Store (0x01, \_SB.PCI0.EH01.PMES)
                Notify (\_SB.PCI0.EH01, 0x02) // Device Wake
            }

            If (\_SB.PCI0.EH02.PMES)
            {
                Store (0x01, \_SB.PCI0.EH02.PMES)
                Notify (\_SB.PCI0.EH02, 0x02) // Device Wake
            }

            If (\_SB.PCI0.XHC.PMES)
            {
                Store (0x01, \_SB.PCI0.XHC.PMES)
                Notify (\_SB.PCI0.XHC, 0x02) // Device Wake
            }

            If (\_SB.PCI0.HDEF.PMES)
            {
                Store (0x01, \_SB.PCI0.HDEF.PMES)
                Notify (\_SB.PCI0.HDEF, 0x02) // Device Wake
            }

            Notify (\_SB.PCI0.LANC, 0x02) // Device Wake
        }

        Method (_L13, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            And (GPIE, Not (0x08), Local0)
            Store (Local0, GPIE) /* \GPIE */
            And (GPSL, Not (0x08), Local0)
            Store (Local0, GPSL) /* \GPSL */
            Or (GPL3, 0x10, Local0)
            Store (Local0, GPL3) /* \GPL3 */
            Sleep (0x03E8)
            Or (GPSL, 0x08, GPSL) /* \GPSL */
            If (LEqual (PRDT, 0x04))
            {
                Notify (\_SB.PCI0.SATA, 0x82) // Device-Specific Change
            }
            Else
            {
                Notify (\_SB.PCI0.SATA, 0x81) // Information Change
            }
        }

        Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            XOr (GIV, 0x2000, Local0)
            Store (Local0, GIV) /* \GIV_ */
            VDET ()

            Sleep (0x03E8)
            Notify (\_SB.PCI0.EH02, 0x00) // Bus Check
            Notify (\_SB.PCI0.SATA, 0x00) // Bus Check
            DKET ()
        }

        Method (HWWP, 1, Serialized)
        {
            If (LEqual (Arg0, 0x01))
            {
                Store (0x00, Local0)
                If (And (GPL0, 0x00400000))
                {
                    Store (0x01, Local0)
                }

                \_SB.PCI0.LPCB.EC0.HWWP (Local0)
            }
        }
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00000410, 0x06) {}
        Processor (CPU1, 0x01, 0x00000410, 0x06) {}
        Processor (CPU2, 0x02, 0x00000410, 0x06) {}
        Processor (CPU3, 0x03, 0x00000410, 0x06) {}
        Processor (CPU4, 0x04, 0x00000410, 0x06) {}
        Processor (CPU5, 0x05, 0x00000410, 0x06) {}
        Processor (CPU6, 0x06, 0x00000410, 0x06) {}
        Processor (CPU7, 0x07, 0x00000410, 0x06) {}
    }

    

    Name (\NIST, Package (0x10)
    {
        "0", 
        "1", 
        "2", 
        "3", 
        "4", 
        "5", 
        "6", 
        "7", 
        "8", 
        "9", 
        "A", 
        "B", 
        "C", 
        "D", 
        "E", 
        "F"
    })
    Method (\ISTR, 2, NotSerialized)
    {
        Store (Arg0, Local0)
        Store ("", Local7)
        Store (Arg1, Local4)
        While (LGreater (Local4, 0x00))
        {
            And (Local0, 0x0F, Local1)
            Store (DerefOf (Index (\NIST, Local1)), Local2)
            Concatenate (Local2, Local7, Local3)
            Store (Local3, Local7)
            ShiftRight (Local0, 0x04, Local0)
            Decrement (Local4)
        }

        Return (Local7)
    }

    Method (\SRCP, 2, NotSerialized)
    {
        Store (SizeOf (Arg0), Local7)
        If (LNotEqual (Local7, SizeOf (Arg1)))
        {
            Return (0x00)
        }

        Name (ST00, Buffer (Local7) {})
        Name (ST01, Buffer (Local7) {})
        Store (Arg0, ST00) /* \SRCP.ST00 */
        Store (Arg1, ST01) /* \SRCP.ST01 */
        Store (0x00, Local6)
        Store (0x01, Local0)
        While (LAnd (LNotEqual (Local6, Local7), Local0))
        {
            Store (DerefOf (Index (ST00, Local6)), Local2)
            Store (DerefOf (Index (ST01, Local6)), Local3)
            Increment (Local6)
            If (LNotEqual (Local2, Local3))
            {
                Store (0x00, Local0)
            }
        }

        Return (Local0)
    }

    Name (WOSI, 0xFF)
    Name (OSID, Package (0x03)
    {
        "Microsoft Windows", 
        "Microsoft WindowsME: Millennium Edition", 
        "Microsoft Windows NT"
    })
    Method (\SRCM, 3, NotSerialized)
    {
        Name (ST00, Buffer (0x8C) {})
        Name (ST01, Buffer (0x8C) {})
        Store (Arg0, ST00) /* \SRCM.ST00 */
        Store (Arg1, ST01) /* \SRCM.ST01 */
        Store (0x00, Local6)
        Store (0x01, Local0)
        While (LAnd (LNotEqual (Local6, Arg2), Local0))
        {
            Store (DerefOf (Index (ST00, Local6)), Local2)
            Store (DerefOf (Index (ST01, Local6)), Local3)
            Increment (Local6)
            If (LNotEqual (Local2, Local3))
            {
                Store (0x00, Local0)
            }
        }

        Return (Local0)
    }

    Method (WCOS, 0, Serialized)
    {
        
        // assume "Windows 2006" values
        Store (0x06, WOSI)
        Store (WOSI, WHOS)
        Return (WOSI)

    }

    Method (UPRW, 2, Serialized)
    {
        Store (Package (0x02)
            {
                0x00, 
                0x00
            }, Local0)
        Store (Arg0, Index (Local0, 0x00))
        If (LEqual (UWKD, 0x00))
        {
            Store (Arg1, Index (Local0, 0x01))
        }

        Return (Local0)
    }

    Name (EUPC, Package (0x04)
    {
        0xFF, 
        0xFF, 
        0x00, 
        0x00
    })
    Name (EPLD, Buffer (0x10)
    {
        /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    })
    Method (CBRT, 2, Serialized)
    {
        Store (SizeOf (Arg0), Local6)
        Store (SizeOf (Arg1), Local7)
        If (LEqual (Local6, 0x00))
        {
            Store (Arg1, Local0)
            Return (Local0)
        }

        If (LEqual (Local7, 0x00))
        {
            Store (Arg0, Local0)
            Return (Local0)
        }

        Add (Local7, Local6, Local1)
        Subtract (Local1, 0x02, Local1)
        Store (Buffer (Local1) {}, Local0)
        Store (0x00, Local1)
        While (LLess (Local1, SizeOf (Arg0)))
        {
            Store (DerefOf (Index (Arg0, Local1)), Index (Local0, Local1))
            Increment (Local1)
        }

        Subtract (Local1, 0x02, Local1)
        Store (0x00, Local2)
        While (LLess (Local2, SizeOf (Arg1)))
        {
            Store (DerefOf (Index (Arg1, Local2)), Index (Local0, Local1))
            Increment (Local1)
            Increment (Local2)
        }

        Return (Local0)
    }

    Scope (\_SB)
    {
        Mutex (MSMI, 0x00)
        Method (SSMI, 5, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            If (Arg4)
            {
                Acquire (\_GL, 0xFFFF)
            }

            ShiftLeft (Arg0, 0x10, EAX) /* \EAX_ */
            Store (Arg1, EBX) /* \EBX_ */
            Store (Arg2, ECX) /* \ECX_ */
            Store (Arg3, EDX) /* \EDX_ */
            Store (0x00, REFS) /* \REFS */
            \_SB.PCI0.GSWS (Arg0)
            Store (REFS, Local0)
            If (Arg4)
            {
                Release (\_GL)
            }

            Release (MSMI)
            Return (Local0)
        }

        Name (BCLI, 0x00)
        Name (BCLS, Package (0x03)
        {
            Package (0x0D) {}, 
            Package (0x17) {}, 
            Package (0x1B) {}
        })
        Name (NITS, Package (0x03)
        {
            Buffer (0x16) {}, 
            Buffer (0x2A) {}, 
            Buffer (0x32) {}
        })
        Name (BCLC, 0x00)
        Method (BCL, 0, Serialized)
        {
            If (LEqual (BCLC, 0x00))
            {
                If (LGreater (\WCOS (), 0x06))
                {
                    Store (BCCT, BRCT) /* \BRCT */
                }

                Store (0x00, Local7)
                If (LGreaterEqual (BRCT, 0x15))
                {
                    Store (0x01, BCLI) /* \_SB_.BCLI */
                    Store (0x01, Local7)
                    If (LEqual (BRCT, 0x19))
                    {
                        Store (0x02, BCLI) /* \_SB_.BCLI */
                    }
                }

                Store (0x00, Local1)
                If (And (DCAP, 0x10))
                {
                    Store (BRLV, Local0)
                    Store (0x00, Local5)
                    Store (BMAP, Local4)
                    While (LLess (Local1, BRCT))
                    {
                        If (Local7)
                        {
                            Store (Local1, Local3)
                        }
                        Else
                        {
                            Store (DerefOf (Index (Local4, Local1)), Local3)
                        }

                        Store (DerefOf (Index (Local0, Local3)), Local2)
                        Multiply (Local2, 0x64, Local3)
                        Divide (Add (Local3, 0x7F), 0xFF, Local6, Local2)
                        Store (Local2, Index (DerefOf (Index (BCLS, BCLI)), Add (Local1, 
                            0x02)))
                        If (LGreater (Local2, Local5))
                        {
                            Store (Local2, Local5)
                        }

                        Increment (Local1)
                    }

                    ShiftRight (BRCT, 0x01, Local3)
                    Store (DerefOf (Index (DerefOf (Index (BCLS, BCLI)), Local3)), 
                        Index (DerefOf (Index (BCLS, BCLI)), 0x01))
                    Store (Local5, Index (DerefOf (Index (BCLS, BCLI)), 0x00))
                }
                Else
                {
                    Store (BCLV, Local4)
                    Store (BMAP, Local0)
                    While (LLess (Local1, Add (BRCT, 0x02)))
                    {
                        If (LOr (Local7, LLess (Local1, 0x02)))
                        {
                            Store (Local1, Local3)
                        }
                        Else
                        {
                            Store (DerefOf (Index (Local0, Subtract (Local1, 0x02))), Local3)
                            Add (Local3, 0x02, Local3)
                        }

                        Store (DerefOf (Index (Local4, Local3)), Local2)
                        Store (Local2, Index (DerefOf (Index (BCLS, BCLI)), Local1))
                        Increment (Local1)
                    }
                }

                Store (BRNT, Local0)
                Store (BMAP, Local1)
                Store (0x00, Local2)
                While (LLess (Local2, BRCT))
                {
                    If (Local7)
                    {
                        Store (Local2, Local3)
                    }
                    Else
                    {
                        Store (DerefOf (Index (Local1, Local2)), Local3)
                    }

                    ShiftLeft (Local3, 0x01, Local3)
                    ShiftLeft (Local2, 0x01, Local5)
                    Store (DerefOf (Index (Local0, Local3)), Local4)
                    Store (Local4, Index (DerefOf (Index (NITS, BCLI)), Local5))
                    Store (DerefOf (Index (Local0, Add (Local3, 0x01))), Local4)
                    Store (Local4, Index (DerefOf (Index (NITS, BCLI)), Add (Local5, 
                        0x01)))
                    Increment (Local2)
                }

                Store (0x01, BCLC) /* \_SB_.BCLC */
            }

            Return (DerefOf (Index (BCLS, BCLI)))
        }

        Name (BRIG, 0x64)
        Method (BCM, 1, Serialized)
        {
            Store (0x00, Local0)
            If (LGreater (\WCOS (), 0x05))
            {
                Or (WDPE, 0x40, WDPE) /* \WDPE */
                Store (0x01, Local0)
            }

            Store (Arg0, BRIG) /* \_SB_.BRIG */
            Store (Match (DerefOf (Index (BCLS, BCLI)), MGE, Arg0, MTR, 
                0x00, 0x02), Local1)
            If (LEqual (Local1, Ones))
            {
                Subtract (SizeOf (DerefOf (Index (BCLS, BCLI))), 0x01, Local1)
            }

            Subtract (Local1, 0x02, Local1)
            If (Local0)
            {
                Store (Local1, BRID) /* \BRID */
            }

            Return (Local0)
        }

        Method (BQC, 0, Serialized)
        {
            Store (BRIG, Local0)
            Return (Local0)
        }

        Method (HDDC, 1, Serialized)
        {
            If (LEqual (Arg0, 0x02))
            {
                Store (EDID, Local1)
            }
            Else
            {
                Store (EDID, Local3)
                Store (0x80, Local0)
                Store (Buffer (Local0) {}, Local1)
                Store (0x00, Local2)
                While (LLess (Local2, Local0))
                {
                    Store (DerefOf (Index (Local3, Local2)), Index (Local1, Local2))
                    Increment (Local2)
                }
            }

            Return (Local1)
        }

        Method (SBRC, 0, Serialized)
        {
            Store (BRID, Local0)
            Subtract (BRCT, 0x01, Local4)
            If (LGreater (BRID, Local4))
            {
                Store (Local4, Local0)
            }

            If (LLess (BRID, 0x00))
            {
                Store (0x00, Local0)
            }

            Store (BRLV, Local2)
            Store (BMAP, Local5)
            If (LEqual (BRCT, 0x0B))
            {
                Store (DerefOf (Index (Local5, Local0)), Local0)
            }

            Store (DerefOf (Index (Local2, Local0)), Local1)
            Store (Local1, Debug)
            Return (Local1)
        }

        Device (WLBU)
        {
            Name (_HID, EisaId ("HPQ6001"))  // _HID: Hardware ID
            Name (DEPT, 0xFF)
            Method (INIT, 0, Serialized)
            {
                If (LEqual (DEPT, 0x0F))
                {
                    Store (0xFF, DEPT) /* \_SB_.WLBU.DEPT */
                }
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If (LEqual (DEPT, 0xFF))
                {
                    Store (0x00, Local0)
                    If (LGreaterEqual (\WCOS (), 0x08))
                    {
                        Store (0x0F, Local0)
                        UWLS ()
                    }

                    Store (Local0, DEPT) /* \_SB_.WLBU.DEPT */
                }

                Return (DEPT) /* \_SB_.WLBU.DEPT */
            }

            Method (UWLS, 0, Serialized)
            {
                Store (WLDA, Local0)
                Store (DerefOf (Index (Local0, 0x07)), Local1)
                If (And (WLFL, 0x02))
                {
                    And (WLFL, Not (0x02), WLFL) /* \WLFL */
                }

                Multiply (Local1, 0x10, Local1)
                Add (Local1, 0x10, Local1)
                Store (0x1B, Local2)
                Store (0x10, Local5)
                Store (0x00, Local4)
                While (LLess (Local2, Local1))
                {
                    Store (DerefOf (Index (Local0, Local2)), Local3)
                    Store (DerefOf (Index (Local0, Local5)), Local6)
                    If (LNotEqual (And (Local3, 0x0A), 0x0A))
                    {
                        Or (Local3, 0x0A, Index (Local0, Local2))
                        Store (0x01, Local4)
                    }

                    If (LEqual (Local6, 0x00))
                    {
                        If (LNotEqual (And (Local3, 0x10), 0x00))
                        {
                            And (Local3, 0xEF, Index (Local0, Local2))
                            Store (0x01, Local4)
                        }
                    }

                    Add (Local2, 0x10, Local2)
                    Add (Local5, 0x10, Local5)
                }

                If (Local4)
                {
                    Store (Local0, WLDA) /* \WLDA */
                    \_SB.SSMI (0xEA84, 0x00, 0x00, 0x00, 0x00)
                }
            }
        }
    }

    Scope (\_SB)
    {
        Device (PCI0)
        {
            Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
            {
                0x10, 
                0x40, 
                0x00, 
                0x00
            })
            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                Return (0x02)
            }

            Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
            {
                Return (0x02)
            }

            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_ADR, 0x00)  // _ADR: Address
            OperationRegion (HBUS, PCI_Config, 0x00, 0x0100)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                Offset (0x40), 
                EPEN,   1, 
                    ,   11, 
                EPBR,   20, 
                Offset (0x48), 
                MHEN,   1, 
                    ,   14, 
                MHBR,   17, 
                Offset (0x50), 
                GCLK,   1, 
                Offset (0x54), 
                D0EN,   1, 
                Offset (0x60), 
                PXEN,   1, 
                PXSZ,   2, 
                    ,   23, 
                PXBR,   6, 
                Offset (0x68), 
                DIEN,   1, 
                    ,   11, 
                DIBR,   20, 
                Offset (0x70), 
                    ,   20, 
                MEBR,   12, 
                Offset (0x80), 
                    ,   4, 
                PM0H,   2, 
                Offset (0x81), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                Offset (0x82), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                Offset (0x83), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                Offset (0x84), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                Offset (0x85), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                Offset (0x86), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                Offset (0x87), 
                Offset (0xA8), 
                    ,   20, 
                TUUD,   19, 
                Offset (0xBC), 
                    ,   20, 
                TLUD,   12, 
                Offset (0xC8), 
                    ,   7, 
                HTSE,   1
            }

            OperationRegion (MCHT, SystemMemory, 0xFED10000, 0x1100)
            Field (MCHT, ByteAcc, NoLock, Preserve)
            {
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, _Y00)
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
    0x00000000,         // Granularity
    0x00000000,         // Range Minimum
    0x00000000,         // Range Maximum
    0x00000000,         // Translation Offset
    0x00000001,         // Length

                    ,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFEE00000,         // Length
                    ,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFEE01000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x011FF000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUF0, \_SB.PCI0._Y00._MAX, PBMX)  // _MAX: Maximum Base Address
                Store (Subtract (ShiftRight (0x04000000, 0x14), 0x02), PBMX) /* \_SB_.PCI0._CRS.PBMX */
                CreateWordField (BUF0, \_SB.PCI0._Y00._LEN, PBLN)  // _LEN: Length
                Store (Subtract (ShiftRight (0x04000000, 0x14), 0x01), PBLN) /* \_SB_.PCI0._CRS.PBLN */
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C0LN)  // _LEN: Length
                    Store (Zero, C0LN) /* \_SB_.PCI0._CRS.C0LN */
                }

                If (LEqual (PM1L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C0RW)  // _RW_: Read-Write Status
                    Store (Zero, C0RW) /* \_SB_.PCI0._CRS.C0RW */
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C4LN)  // _LEN: Length
                    Store (Zero, C4LN) /* \_SB_.PCI0._CRS.C4LN */
                }

                If (LEqual (PM1H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C4RW)  // _RW_: Read-Write Status
                    Store (Zero, C4RW) /* \_SB_.PCI0._CRS.C4RW */
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, C8LN)  // _LEN: Length
                    Store (Zero, C8LN) /* \_SB_.PCI0._CRS.C8LN */
                }

                If (LEqual (PM2L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, C8RW)  // _RW_: Read-Write Status
                    Store (Zero, C8RW) /* \_SB_.PCI0._CRS.C8RW */
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, CCLN)  // _LEN: Length
                    Store (Zero, CCLN) /* \_SB_.PCI0._CRS.CCLN */
                }

                If (LEqual (PM2H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, CCRW)  // _RW_: Read-Write Status
                    Store (Zero, CCRW) /* \_SB_.PCI0._CRS.CCRW */
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D0LN)  // _LEN: Length
                    Store (Zero, D0LN) /* \_SB_.PCI0._CRS.D0LN */
                }

                If (LEqual (PM3L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D0RW)  // _RW_: Read-Write Status
                    Store (Zero, D0RW) /* \_SB_.PCI0._CRS.D0RW */
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D4LN)  // _LEN: Length
                    Store (Zero, D4LN) /* \_SB_.PCI0._CRS.D4LN */
                }

                If (LEqual (PM3H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D4RW)  // _RW_: Read-Write Status
                    Store (Zero, D4RW) /* \_SB_.PCI0._CRS.D4RW */
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, D8LN)  // _LEN: Length
                    Store (Zero, D8LN) /* \_SB_.PCI0._CRS.D8LN */
                }

                If (LEqual (PM4L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, D8RW)  // _RW_: Read-Write Status
                    Store (Zero, D8RW) /* \_SB_.PCI0._CRS.D8RW */
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, DCLN)  // _LEN: Length
                    Store (Zero, DCLN) /* \_SB_.PCI0._CRS.DCLN */
                }

                If (LEqual (PM4H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, DCRW)  // _RW_: Read-Write Status
                    Store (Zero, DCRW) /* \_SB_.PCI0._CRS.DCRW */
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E0LN)  // _LEN: Length
                    Store (Zero, E0LN) /* \_SB_.PCI0._CRS.E0LN */
                }

                If (LEqual (PM5L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E0RW)  // _RW_: Read-Write Status
                    Store (Zero, E0RW) /* \_SB_.PCI0._CRS.E0RW */
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E4LN)  // _LEN: Length
                    Store (Zero, E4LN) /* \_SB_.PCI0._CRS.E4LN */
                }

                If (LEqual (PM5H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E4RW)  // _RW_: Read-Write Status
                    Store (Zero, E4RW) /* \_SB_.PCI0._CRS.E4RW */
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, E8LN)  // _LEN: Length
                    Store (Zero, E8LN) /* \_SB_.PCI0._CRS.E8LN */
                }

                If (LEqual (PM6L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, E8RW)  // _RW_: Read-Write Status
                    Store (Zero, E8RW) /* \_SB_.PCI0._CRS.E8RW */
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, ECLN)  // _LEN: Length
                    Store (Zero, ECLN) /* \_SB_.PCI0._CRS.ECLN */
                }

                If (LEqual (PM6H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, ECRW)  // _RW_: Read-Write Status
                    Store (Zero, ECRW) /* \_SB_.PCI0._CRS.ECRW */
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, F0LN)  // _LEN: Length
                    Store (Zero, F0LN) /* \_SB_.PCI0._CRS.F0LN */
                }

                If (LEqual (PM0H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0D._RW, F0RW)  // _RW_: Read-Write Status
                    Store (Zero, F0RW) /* \_SB_.PCI0._CRS.F0RW */
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MIN, M1MN)  // _MIN: Minimum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MAX, M1MX)  // _MAX: Maximum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._LEN, M1LN)  // _LEN: Length
                ShiftLeft (TLUD, 0x14, M1MN) /* \_SB_.PCI0._CRS.M1MN */
                ShiftLeft (PXBR, 0x1A, Local0)
                Subtract (Local0, 0x01, M1MX) /* \_SB_.PCI0._CRS.M1MX */
                Add (Subtract (M1MX, M1MN), 0x01, M1LN) /* \_SB_.PCI0._CRS.M1LN */
                CreateDWordField (BUF0, \_SB.PCI0._Y0F._MIN, M2MN)  // _MIN: Minimum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0F._MAX, M2MX)  // _MAX: Maximum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0F._LEN, M2LN)  // _LEN: Length
                ShiftRight (0x10000000, PXSZ, Local1)
                Add (Local0, Local1, M2MN) /* \_SB_.PCI0._CRS.M2MN */
                Add (Subtract (M2MX, M2MN), 0x01, M2LN) /* \_SB_.PCI0._CRS.M2LN */
                Return (BUF0) /* \_SB_.PCI0.BUF0 */
            }

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                Name (_UID, 0x01)  // _UID: Unique ID
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00004000,         // Address Length
                        _Y10)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00008000,         // Address Length
                        _Y11)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y12)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y13)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y15)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y14)
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Memory32Fixed (ReadOnly,
                        0xFED90000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x0004B000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y10._BAS, RBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.LPCB.RCBA, 0x0E, RBR0) /* \_SB_.PCI0.PDRC._CRS.RBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y11._BAS, MBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.MHBR, 0x0F, MBR0) /* \_SB_.PCI0.PDRC._CRS.MBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y12._BAS, DBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.DIBR, 0x0C, DBR0) /* \_SB_.PCI0.PDRC._CRS.DBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y13._BAS, EBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.EPBR, 0x0C, EBR0) /* \_SB_.PCI0.PDRC._CRS.EBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y14._BAS, XBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.PXBR, 0x1A, XBR0) /* \_SB_.PCI0.PDRC._CRS.XBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y14._LEN, XSZ0)  // _LEN: Length
                    ShiftRight (0x10000000, \_SB.PCI0.PXSZ, XSZ0) /* \_SB_.PCI0.PDRC._CRS.XSZ0 */
                    If (TBRB)
                    {
                        CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y15._BAS, TBR0)  // _BAS: Base Address
                        Store (TBRB, TBR0) /* \_SB_.PCI0.PDRC._CRS.TBR0 */
                    }
                    Else
                    {
                        CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y15._LEN, TBLN)  // _LEN: Length
                        Store (Zero, TBLN) /* \_SB_.PCI0.PDRC._CRS.TBLN */
                    }

                    Return (BUF0) /* \_SB_.PCI0.PDRC.BUF0 */
                }
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    Store (And (Arg0, 0x07), DSEN) /* \DSEN */
                    HDOS (Arg0)
                }

                Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                {
                    If (LEqual (DODC, 0x00))
                    {
                        Store (0x01, DODC) /* \_SB_.PCI0.IGPU.DODC */
                        If (SCIP ())
                        {
                            HDOD ()
                            Store (0x00, NDID) /* \NDID */
                            If (CondRefOf (IDAB)) {}
                            Else
                            {
                                If (LNotEqual (DIDL, Zero))
                                {
                                    Store (SDDL (DIDL), DID1) /* \DID1 */
                                }

                                If (LNotEqual (DDL2, Zero))
                                {
                                    Store (SDDL (DDL2), DID2) /* \DID2 */
                                }

                                If (LNotEqual (DDL3, Zero))
                                {
                                    Store (SDDL (DDL3), DID3) /* \DID3 */
                                }

                                If (LNotEqual (DDL4, Zero))
                                {
                                    Store (SDDL (DDL4), DID4) /* \DID4 */
                                }

                                If (LNotEqual (DDL5, Zero))
                                {
                                    Store (SDDL (DDL5), DID5) /* \DID5 */
                                }

                                If (LNotEqual (DDL6, Zero))
                                {
                                    Store (SDDL (DDL6), DID6) /* \DID6 */
                                }

                                If (LNotEqual (DDL7, Zero))
                                {
                                    Store (SDDL (DDL7), DID7) /* \DID7 */
                                }

                                If (LNotEqual (DDL8, Zero))
                                {
                                    Store (SDDL (DDL8), DID8) /* \DID8 */
                                }
                            }
                        }

                        If (LEqual (NDID, 0x00))
                        {
                            Store (0x0400, Index (DerefOf (Index (DODS, NDID)), 0x00))
                        }

                        If (LEqual (NDID, 0x01))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                        }

                        If (LEqual (NDID, 0x02))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                        }

                        If (LEqual (NDID, 0x03))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                        }

                        If (LEqual (NDID, 0x04))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                        }

                        If (LEqual (NDID, 0x05))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                            Store (Or (0x00010000, DID5), Index (DerefOf (Index (DODS, NDID
                                )), 0x04))
                        }

                        If (LEqual (NDID, 0x06))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                            Store (Or (0x00010000, DID5), Index (DerefOf (Index (DODS, NDID
                                )), 0x04))
                            Store (Or (0x00010000, DID6), Index (DerefOf (Index (DODS, NDID
                                )), 0x05))
                        }

                        If (LEqual (NDID, 0x07))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                            Store (Or (0x00010000, DID5), Index (DerefOf (Index (DODS, NDID
                                )), 0x04))
                            Store (Or (0x00010000, DID6), Index (DerefOf (Index (DODS, NDID
                                )), 0x05))
                            Store (Or (0x00010000, DID7), Index (DerefOf (Index (DODS, NDID
                                )), 0x06))
                        }

                        If (LEqual (NDID, 0x08))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                            Store (Or (0x00010000, DID5), Index (DerefOf (Index (DODS, NDID
                                )), 0x04))
                            Store (Or (0x00010000, DID6), Index (DerefOf (Index (DODS, NDID
                                )), 0x05))
                            Store (Or (0x00010000, DID7), Index (DerefOf (Index (DODS, NDID
                                )), 0x06))
                            Store (Or (0x00010000, DID8), Index (DerefOf (Index (DODS, NDID
                                )), 0x07))
                        }
                    }

                    Store (NDID, Local0)
                    If (LGreater (NDID, 0x08))
                    {
                        Store (0x00, Local0)
                    }

                    Return (DerefOf (Index (DODS, Local0)))
                }

                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If (LEqual (\_SB.PCI0.IGPU.INIM, 0x01))
                    {
                        \_SB.PCI0.IGPU.GLID (\_SB.LID._LID ())
                        Store (0x00, \_SB.PCI0.IGPU.INIM)
                    }
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID1, 0x00))
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID1))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (CDDS (DID1))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD1) /* \NXD1 */
                        }

                        Return (NDDS (DID1))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD02)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID2, 0x00))
                        {
                            Return (0x02)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID2))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (LIDS, 0x00))
                        {
                            Return (0x00)
                        }

                        Return (CDDS (DID2))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD2) /* \NXD2 */
                        }

                        Return (NDDS (DID2))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD03)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID3, 0x00))
                        {
                            Return (0x03)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID3))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID3, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID3))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD3) /* \NXD3 */
                        }

                        Return (NDDS (DID3))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID4, 0x00))
                        {
                            Return (0x04)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID4))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID4, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID4))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD4) /* \NXD4 */
                        }

                        Return (NDDS (DID4))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD05)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID5, 0x00))
                        {
                            Return (0x05)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID5))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID5, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID5))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD5) /* \NXD5 */
                        }

                        Return (NDDS (DID5))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD06)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID6, 0x00))
                        {
                            Return (0x06)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID6))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID6, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID6))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD6) /* \NXD6 */
                        }

                        Return (NDDS (DID6))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD07)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID7, 0x00))
                        {
                            Return (0x07)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID7))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID7, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID7))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD7) /* \NXD7 */
                        }

                        Return (NDDS (DID7))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD08)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID8, 0x00))
                        {
                            Return (0x08)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID8))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID8, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID8))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD8) /* \NXD8 */
                        }

                        Return (NDDS (DID8))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Method (SDDL, 1, NotSerialized)
                {
                    Increment (NDID)
                    Store (And (Arg0, 0x0F0F), Local0)
                    Or (0x80000000, Local0, Local1)
                    If (LEqual (DIDL, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL2, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL3, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL4, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL5, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL6, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL7, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL8, Local0))
                    {
                        Return (Local1)
                    }

                    Return (0x00)
                }

                Method (CDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (0x00, Local0))
                    {
                        Return (0x1D)
                    }

                    If (LEqual (CADL, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL2, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL3, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL4, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL5, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL6, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL7, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL8, Local0))
                    {
                        Return (0x1F)
                    }

                    Return (0x1D)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (0x00, Local0))
                    {
                        Return (0x00)
                    }

                    If (LEqual (NADL, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL2, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL3, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL4, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL5, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL6, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL7, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL8, Local0))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Scope (\_SB.PCI0)
                {
                    OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)
                    Field (MCHP, AnyAcc, NoLock, Preserve)
                    {
                        Offset (0x60), 
                        TASM,   10, 
                        Offset (0x62)
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                    Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                    Offset (0x18), 
                    Offset (0xA4), 
                    ASLE,   8, 
                    Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                    Offset (0xB0), 
                        ,   12, 
                    CDVL,   1, 
                    Offset (0xB2), 
                    Offset (0xB5), 
                    LBPC,   8, 
                    Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                    DMOD,   32, 
                    PCON,   32, 
                    DVER,   64, 
                    Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                    Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                    Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                    Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                    Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                    CBLV,   32, 
                    BCLM,   320, 
                    CPFM,   32, 
                    EPFM,   32, 
                    PLUT,   592, 
                    PFMB,   32, 
                    CCDV,   32, 
                    PCFT,   32, 
                    Offset (0x400), 
                    GVD1,   49152, 
                    PHED,   32, 
                    BDDC,   2048
                }

                

                Name (DBTB, Package (0x15)
                {
                    0x00, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x05)
                {
                    Package (0x02)
                    {
                        0xE4, 
                        0x0140
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0x00, 
                        0x00
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }
                })
                Name (SUCC, 0x01)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x59, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If (LEqual (GESF, 0x01))
                        {
                            Store (0x80, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Store (0x30000000, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Or (PARM, ShiftLeft (LIDS, 0x10), PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Add (PARM, 0x00010000, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                            Return (Zero)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (GIVD, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            XOr (PARM, 0x01, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Or (PARM, ShiftLeft (GMFN, 0x01), PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Or (PARM, ShiftLeft (0x03, 0x0B), PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Or (PARM, ShiftLeft (IDMS, 0x11), PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Or (ShiftLeft (DerefOf (Index (DerefOf (Index (CDCT, HVCO)), CDVL
                                )), 0x15), PARM, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (0x01, GESF) /* \_SB_.PCI0.IGPU.GESF */
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            Store (0x00, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (0x00, GESF) /* \_SB_.PCI0.IGPU.GESF */
                            Return (Zero)
                        }

                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (CRIT) /* \_SB_.PCI0.IGPU.CRIT */
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x00, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (0x000F87FD, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (0x40, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            If (LEqual (PARM, 0x00))
                            {
                                Store (CLID, Local0)
                                If (And (0x80000000, Local0))
                                {
                                    And (CLID, 0x0F, CLID) /* \_SB_.PCI0.IGPU.CLID */
                                    GLID (CLID)
                                }
                            }

                            Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                            Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                            Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                        }

                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC) /* \_SB_.PCI0.GFX0.GXFC */
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC) /* \_SB_.PCI0.GFX0.GXFC */
                    }

                    Store (0x00, GEFC) /* \_SB_.PCI0.GFX0.GEFC */
                    Store (0x01, SCIS) /* \SCIS */
                    Store (0x00, GSSE) /* \_SB_.PCI0.GFX0.GSSE */
                    Store (0x00, SCIE) /* \_SB_.PCI0.GFX0.SCIE */
                    Return (Zero)
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (LNot (DRDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (DRDY))
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If (LGreater (CSTS, 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return (LEqual (CSTS, 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (0x01)
                    }

                    Store (Arg0, CEVT) /* \_SB_.PCI0.IGPU.CEVT */
                    Store (0x03, CSTS) /* \_SB_.PCI0.IGPU.CSTS */
                    If (LAnd (LEqual (CHPD, 0x00), LEqual (Arg1, 0x00)))
                    {
                        If (LAnd (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                        {
                            Notify (\_SB.PCI0, Arg1)
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.IGPU, Arg1)
                        }
                    }

                    If (CondRefOf (WMAB))
                    {
                        WMAB (Arg0)
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.IGPU, 0x80) // Status Change
                    }

                    If (LNot (PSTS ()))
                    {
                        Store (0x00, CEVT) /* \_SB_.PCI0.IGPU.CEVT */
                    }

                    Return (0x00)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    Store (Arg0, TIDX) /* \_SB_.PCI0.IGPU.TIDX */
                    Return (GNOT (0x01, 0x00))
                }

                Method (GLID, 1, NotSerialized)
                {
                    Store (Arg0, CLID) /* \_SB_.PCI0.IGPU.CLID */
                    Return (GNOT (0x02, 0x00))
                }

                Method (GDCK, 1, NotSerialized)
                {
                    Store (Arg0, CDCK) /* \_SB_.PCI0.IGPU.CDCK */
                    Return (GNOT (0x04, 0x00))
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (LNot (ARDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (ARDY))
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (LNot (And (TCHE, ShiftLeft (0x01, Arg0))))
                    {
                        Return (0x01)
                    }

                    If (PARD ())
                    {
                        Return (0x01)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        If (CPFM)
                        {
                            And (CPFM, 0x0F, Local0)
                            And (EPFM, 0x0F, Local1)
                            If (LEqual (Local0, 0x01))
                            {
                                If (And (Local1, 0x06))
                                {
                                    Store (0x06, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                                }
                                Else
                                {
                                    If (And (Local1, 0x08))
                                    {
                                        Store (0x08, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                                    }
                                    Else
                                    {
                                        Store (0x01, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                If (And (Local1, 0x08))
                                {
                                    Store (0x08, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                                }
                                Else
                                {
                                    If (And (Local1, 0x01))
                                    {
                                        Store (0x01, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                                    }
                                    Else
                                    {
                                        Store (0x06, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x08))
                            {
                                If (And (Local1, 0x01))
                                {
                                    Store (0x01, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                                }
                                Else
                                {
                                    If (And (Local1, 0x06))
                                    {
                                        Store (0x06, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                                    }
                                    Else
                                    {
                                        Store (0x08, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                                    }
                                }
                            }
                        }
                        Else
                        {
                            XOr (PFIT, 0x07, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                        }

                        Or (PFIT, 0x80000000, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                        Store (0x04, ASLC) /* \_SB_.PCI0.IGPU.ASLC */
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Arg1, BCLP) /* \_SB_.PCI0.IGPU.BCLP */
                            Or (BCLP, 0x80000000, BCLP) /* \_SB_.PCI0.IGPU.BCLP */
                            Store (0x02, ASLC) /* \_SB_.PCI0.IGPU.ASLC */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x00))
                            {
                                Store (Arg1, ALSI) /* \_SB_.PCI0.IGPU.ALSI */
                                Store (0x01, ASLC) /* \_SB_.PCI0.IGPU.ASLC */
                            }
                            Else
                            {
                                Return (0x01)
                            }
                        }
                    }

                    Store (0x01, ASLE) /* \_SB_.PCI0.IGPU.ASLE */
                    Return (0x00)
                }

                Method (SCIP, 0, NotSerialized)
                {
                    If (LNotEqual (OVER, 0x00))
                    {
                        Return (LNot (GSMI))
                    }

                    Return (0x00)
                }

                Device (\_SB.MEM2)
                {
                    Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Name (CRS1, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x20000000,         // Address Base
                            0x00200000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x40000000,         // Address Base
                            0x00200000,         // Address Length
                            )
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x20000000,         // Address Base
                            0x00200000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x40004000,         // Address Base
                            0x00001000,         // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (IGDS)
                        {
                            Return (0x0F)
                        }

                        Return (0x00)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (LOr (LEqual (And (PNHM, 0x0FFF0FF0), 0x000206A0), LEqual (And (
                            PNHM, 0x0FFF0FFF), 0x000306A0)))
                        {
                            Return (CRS1) /* \_SB_.MEM2.CRS1 */
                        }

                        Return (CRS2) /* \_SB_.MEM2.CRS2 */
                    }
                }
                
                OperationRegion (RMPC, PCI_Config, 0x10, 4)
                Field (RMPC, AnyAcc, NoLock, Preserve)
                {
                    BAR1,32,
                }
                Device (PNLF)
                {
                    // normal PNLF declares (note some of this probably not necessary)
                    Name (_ADR, Zero)
                    Name (_HID, EisaId ("APP0002"))
                    Name (_CID, "backlight")
                    Name (_UID, 10)
                    Name (_STA, 0x0B)
                    //define hardware register access for brightness
                    // lower nibble of BAR1 is status bits and not part of the address
                    OperationRegion (BRIT, SystemMemory, And(^BAR1, Not(0xF)), 0xe1184)
                    Field (BRIT, AnyAcc, Lock, Preserve)
                    {
                        Offset(0x48250),
                        LEV2, 32,
                        LEVL, 32,
                        Offset(0x70040),
                        P0BL, 32,
                        Offset(0xc8250),
                        LEVW, 32,
                        LEVX, 32,
                        Offset(0xe1180),
                        PCHL, 32,
                    }
                    // DEB1 special for setting KLVX at runtime...
                    //Method (DEB1, 1, NotSerialized)
                    //{
                    //    Store(Arg0, KLVX)
                    //}
                    // LMAX: use 0x710 to force OS X value
                    //       or use any arbitrary value
                    //       or use 0 to capture BIOS setting
                    Name (LMAX, 0x710)
                    // KMAX: defines the unscaled range in the _BCL table below
                    Name (KMAX, 0x710)
                    // KPCH: saved value for PCHL
                    //   use Ones if PCHL does not need to be set (normal)
                    //   use Zero if your laptop nees PCHL set on every brightness set
                    //   you can also use a custom value (not Ones, not Zero)
                    Name(KPCH, Ones)
                    // _INI deals with differences between native setting and desired
                    Method (_INI, 0, NotSerialized)
                    {
                        // save value of PCHL for later
                        If (LNot(KPCH)) { Store(PCHL, KPCH) }
                        // determine LMAX to use
                        If (LNot(LMAX)) { Store(ShiftRight(LEVX,16), LMAX) }
                        If (LNot(LMAX)) { Store(KMAX, LMAX) }
                        Store(ShiftLeft(LMAX,16), KLVX)
                        If (LNotEqual(LMAX, KMAX))
                        {
                            // Scale all the values in _BCL to the PWM max in use
                            Store(0, Local0)
                            While (LLess(Local0, SizeOf(_BCL)))
                            {
                                Store(DerefOf(Index(_BCL,Local0)), Local1)
                                Divide(Multiply(Local1,LMAX), KMAX,, Local1)
                                Store(Local1, Index(_BCL,Local0))
                                Increment(Local0)
                            }
                            // Also scale XRGL and XRGH values
                            Divide(Multiply(XRGL,LMAX), KMAX,, XRGL)
                            Divide(Multiply(XRGH,LMAX), KMAX,, XRGH)
                        }
                        // adjust values to desired LMAX
                        Store(ShiftRight(LEVX,16), Local1)
                        If (LNotEqual(Local1, LMAX))
                        {
                            Store(LEVL, Local0)
                            If (LOr(LNot(Local0),LNot(Local1))) { Store(LMAX, Local0) Store(LMAX, Local1) }
                            Divide(Multiply(Local0,LMAX), Local1,, Local0)
                            //REVIEW: wait for vblank before setting new PWM config
                            //Store(P0BL, Local7)
                            //While (LEqual (P0BL, Local7)) {}
                            If (LGreater(LEVL, LMAX))
                            { Store(KLVX, LEVX) Store(Local0, LEVL) }
                            Else
                            { Store(Local0, LEVL) Store(KLVX, LEVX) }
                        }
                    }
                    // _BCM/_BQC: set/get for brightness level
                    Method (_BCM, 1, NotSerialized)
                    {
                        // initialize for consistent backlight level before/after sleep
                        If (LAnd(LNotEqual(KPCH, Ones),LNotEqual(PCHL, KPCH))) { Store(KPCH, PCHL) }
                        If (LNotEqual(LEVW, 0x80000000)) { Store (0x80000000, LEVW) }
                        If (LNotEqual(LEVX, KLVX)) { Store (KLVX, LEVX) }
                        // store new backlight level
                        Store(Match(_BCL, MGE, Arg0, MTR, 0, 2), Local0)
                        If (LEqual(Local0, Ones)) { Subtract(SizeOf(_BCL), 1, Local0) }
                        If (LNotEqual(LEV2, 0x80000000)) { Store(0x80000000, LEV2) }
                        Store(DerefOf(Index(_BCL, Local0)), LEVL)
                    }
                    Method (_BQC, 0, NotSerialized)
                    {
                        Store(Match(_BCL, MGE, LEVL, MTR, 0, 2), Local0)
                        If (LEqual(Local0, Ones)) { Subtract(SizeOf(_BCL), 1, Local0) }
                        Return(DerefOf(Index(_BCL, Local0)))
                    }
                    Method (_DOS, 1, NotSerialized)
                    {
                        // Note: Some systems have this defined in DSDT, so uncomment
                        // the next line if that is the case.
                        //External(^^_DOS, MethodObj)
                        ^^_DOS(Arg0)
                    }
                    // extended _BCM/_BQC for setting "in between" levels
                    Method (XBCM, 1, NotSerialized)
                    {
                        // initialize for consistent backlight level before/after sleep
                        If (LAnd(LNotEqual(KPCH, Ones),LNotEqual(PCHL, KPCH))) { Store(KPCH, PCHL) }
                        If (LNotEqual(LEVW, 0x80000000)) { Store (0x80000000, LEVW) }
                        If (LNotEqual(LEVX, KLVX)) { Store (KLVX, LEVX) }
                        // store new backlight level
                        If (LGreater(Arg0, XRGH)) { Store(XRGH, Arg0) }
                        If (LAnd(Arg0, LLess(Arg0, XRGL))) { Store(XRGL, Arg0) }
                        If (LNotEqual(LEV2, 0x80000000)) { Store(0x80000000, LEV2) }
                        Store(Arg0, LEVL)
                    }
                    Method (XBQC, 0, NotSerialized)
                    {
                        Store(LEVL, Local0)
                        If (LGreater(Local0, XRGH)) { Store(XRGH, Local0) }
                        If (LAnd(Local0, LLess(Local0, XRGL))) { Store(XRGL, Local0) }
                        Return(Local0)
                    }
                    // Set XOPT bit 0 to disable smooth transitions
                    // Set XOPT bit 1 to wait for native BacklightHandler
                    // Set XOPT bit 2 to force use of native BacklightHandler
                    Name (XOPT, 0x02)
                    // XRGL/XRGH: defines the valid range
                    Name (XRGL, 40)
                    Name (XRGH, 1808)
                    // KLVX is initialization value for LEVX
                    Name (KLVX, 0x7100000)
                    // _BCL: returns list of valid brightness levels
                    // first two entries describe ac/battery power levels
                    Name (_BCL, Package()
                    {
                        1808,
                        479,
                        0,
                        53, 55, 57, 59,
                        62, 66, 71, 77,
                        83, 91, 99, 108,
                        119, 130, 142, 154,
                        168, 183, 198, 214,
                        232, 250, 269, 289,
                        309, 331, 354, 377,
                        401, 426, 453, 479,
                        507, 536, 566, 596,
                        627, 660, 693, 727,
                        762, 797, 834, 872,
                        910, 949, 990, 1031,
                        1073, 1115, 1159, 1204,
                        1249, 1296, 1343, 1391,
                        1440, 1490, 1541, 1592,
                        1645, 1698, 1753, 1808,
                    })
                }
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Return (Package()
                    {
                        "AAPL,ig-platform-id", Buffer() { 0x03, 0x00, 0x66, 0x01 },
                        "hda-gfx", Buffer() { "onboard-1" },
                    })
                }

                
            }

            Scope (IGPU)
            {
                Name (DODC, 0x00)
                Name (INIM, 0x00)
                Name (HPDD, Package (0x09)
                {
                    0x0400, 
                    0x0100, 
                    0x0200, 
                    0x0300, 
                    0x0301, 
                    0x0302, 
                    0x0303, 
                    0x0304, 
                    0x0305
                })
                Name (DSPR, Buffer (0x09)
                {
                    /* 0000 */   0x00, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x01,
                    /* 0008 */   0x02
                })
                Name (DODS, Package (0x09)
                {
                    Package (0x01)
                    {
                        0xFFFFFFFF
                    }, 

                    Package (0x01)
                    {
                        0xFFFFFFFF
                    }, 

                    Package (0x02)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x03)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x04)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x05)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x06)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x07)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x08)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }
                })
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (0x01, INIM) /* \_SB_.PCI0.IGPU.INIM */
                    DKET ()
                    Store (0x00, WDSA) /* \WDSA */
                    Store (0x00, WDST) /* \WDST */
                    Store (0x00, WDGN) /* \WDGN */
                }

                Method (HDOS, 1, NotSerialized)
                {
                    And (WDPE, 0xF8, Local0)
                    And (WDPE, 0x87, Local1)
                    Or (Local0, Arg0, WDPE) /* \WDPE */
                    If (CondRefOf (^PDOS, Local2))
                    {
                        ^PDOS (Arg0, Local1)
                    }
                }

                Method (HDOD, 0, NotSerialized)
                {
                    Store (0x01, Local1)
                    If (And (TCHE, 0x02))
                    {
                        Store (0x03, Local1)
                    }

                    Or (DCAP, Local1, DCAP) /* \DCAP */
                }

                Method (PDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (0x00, Local0))
                    {
                        Return (0x00)
                    }

                    If (LEqual (CPDL, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL2, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL3, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL4, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL5, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL6, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL7, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL8, Local0))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (UPNA, 2, Serialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (NADL, Local1)
                        Store (Arg1, NADL) /* \_SB_.PCI0.IGPU.NADL */
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Store (NDL2, Local1)
                        Store (Arg1, NDL2) /* \_SB_.PCI0.IGPU.NDL2 */
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (NDL3, Local1)
                        Store (Arg1, NDL3) /* \_SB_.PCI0.IGPU.NDL3 */
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (NDL4, Local1)
                        Store (Arg1, NDL4) /* \_SB_.PCI0.IGPU.NDL4 */
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (NDL5, Local1)
                        Store (Arg1, NDL5) /* \_SB_.PCI0.IGPU.NDL5 */
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (NDL6, Local1)
                        Store (Arg1, NDL6) /* \_SB_.PCI0.IGPU.NDL6 */
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (NDL7, Local1)
                        Store (Arg1, NDL7) /* \_SB_.PCI0.IGPU.NDL7 */
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (NDL8, Local1)
                        Store (Arg1, NDL8) /* \_SB_.PCI0.IGPU.NDL8 */
                    }

                    Return (Local1)
                }

                Method (UPAA, 0, Serialized)
                {
                    Store (0x00, Local1)
                    While (LLess (Local1, SizeOf (HPDD)))
                    {
                        ShiftLeft (0x01, Local1, Local0)
                        Store (DerefOf (Index (HPDD, Local1)), Local2)
                        If (PDDS (Local2))
                        {
                            Or (WDST, Local0, WDST) /* \WDST */
                        }
                        Else
                        {
                            And (WDST, Not (Local0), WDST) /* \WDST */
                        }

                        If (LEqual (CDDS (Local2), 0x1F))
                        {
                            Or (WDSA, Local0, WDSA) /* \WDSA */
                        }
                        Else
                        {
                            And (WDSA, Not (Local0), WDSA) /* \WDSA */
                        }

                        Increment (Local1)
                    }
                }

                Method (UPND, 0, Serialized)
                {
                    Store (WDGN, Local1)
                    Store (0x00, Local0)
                    Store (0x00, Local2)
                    While (LAnd (LLess (Local0, SizeOf (DSPR)), Local1))
                    {
                        Store (DerefOf (Index (DSPR, Local0)), Local3)
                        ShiftLeft (0x01, Local3, Local4)
                        If (And (Local1, Local4))
                        {
                            Store (DerefOf (Index (HPDD, Local3)), Local5)
                            UPNA (Local2, Local5)
                            Increment (Local2)
                            And (Local1, Not (Local4), Local1)
                        }

                        If (LGreaterEqual (Local2, 0x02))
                        {
                            Break
                        }

                        Increment (Local0)
                    }

                    XOr (WDGN, Local1, WDGN) /* \WDGN */
                    Store (0x01, Local1)
                    While (LAnd (LLess (Local2, 0x08), Local1))
                    {
                        Store (UPNA (Local2, 0x00), Local1)
                        Increment (Local2)
                    }
                }

                Method (GF4E, 1, Serialized)
                {
                    UPAA ()
                    If (LEqual (WDSA, 0x01))
                    {
                        Or (WDST, 0x01, WDGN) /* \WDGN */
                    }
                    Else
                    {
                        If (And (WDSA, 0x01))
                        {
                            And (WDST, Not (0x01), WDGN) /* \WDGN */
                        }
                        Else
                        {
                            Store (0x01, WDGN) /* \WDGN */
                        }
                    }

                    UPND ()
                    Signal (\_SB.F4EV)
                    GHDS (0x00)
                    Return (0x01)
                }

                Method (DKET, 0, NotSerialized)
                {
                    If (LEqual (\_SB.PCI0.IGPU.GIVD, 0x00))
                    {
                        Store ("GFX DockEvent Enter", Debug)
                        Store (\_SB.DCKD (), Local0)
                        Store ("Dock Status", Debug)
                        Store (Local0, Debug)
                        \_SB.PCI0.IGPU.GDCK (Local0)
                        Store ("GFX DockEvent Exit", Debug)
                    }

                    Return (0x00)
                }

                Method (RFHS, 1, Serialized)
                {
                    If (Arg0)
                    {
                        UPAA ()
                    }
                    Else
                    {
                        Wait (\_SB.F4EV, 0x0500)
                    }
                }

                Method (SNXS, 0, Serialized)
                {
                    UPND ()
                    GHDS (0x00)
                }

                Method (SBRV, 0, Serialized)
                {
                    Store ("Set Brightness", Debug)
                    If (LEqual (And (DCAP, 0x02), 0x00))
                    {
                        If (And (TCHE, 0x02))
                        {
                            Store ("TCHE set", Debug)
                            Or (DCAP, 0x02, DCAP) /* \DCAP */
                        }
                    }

                    And (DCAP, 0x02, Local3)
                    If (Local3)
                    {
                        Store ("OpRegion take control of Brightness", Debug)
                        Store (\_SB.SBRC (), Local1)
                        Store (Local1, Debug)
                        AINT (0x01, Local1)
                    }

                    Return (Local3)
                }

                Scope (DD02)
                {
                    Method (_BCL, 0, Serialized)  // _BCL: Brightness Control Levels
                    {
                        If (LLessEqual (\WCOS (), 0x07))
                        {
                            Return (\_SB.BCL ())
                        }
                        Else
                        {
                            If (\_SB.PCI0.IGPU.GIVD)
                            {
                                Return (\_SB.BCL ())
                            }
                            Else
                            {
                                Return (Package (0x67)
                                {
                                    0x50, 
                                    0x32, 
                                    0x00, 
                                    0x01, 
                                    0x02, 
                                    0x03, 
                                    0x04, 
                                    0x05, 
                                    0x06, 
                                    0x07, 
                                    0x08, 
                                    0x09, 
                                    0x0A, 
                                    0x0B, 
                                    0x0C, 
                                    0x0D, 
                                    0x0E, 
                                    0x0F, 
                                    0x10, 
                                    0x11, 
                                    0x12, 
                                    0x13, 
                                    0x14, 
                                    0x15, 
                                    0x16, 
                                    0x17, 
                                    0x18, 
                                    0x19, 
                                    0x1A, 
                                    0x1B, 
                                    0x1C, 
                                    0x1D, 
                                    0x1E, 
                                    0x1F, 
                                    0x20, 
                                    0x21, 
                                    0x22, 
                                    0x23, 
                                    0x24, 
                                    0x25, 
                                    0x26, 
                                    0x27, 
                                    0x28, 
                                    0x29, 
                                    0x2A, 
                                    0x2B, 
                                    0x2C, 
                                    0x2D, 
                                    0x2E, 
                                    0x2F, 
                                    0x30, 
                                    0x31, 
                                    0x32, 
                                    0x33, 
                                    0x34, 
                                    0x35, 
                                    0x36, 
                                    0x37, 
                                    0x38, 
                                    0x39, 
                                    0x3A, 
                                    0x3B, 
                                    0x3C, 
                                    0x3D, 
                                    0x3E, 
                                    0x3F, 
                                    0x40, 
                                    0x41, 
                                    0x42, 
                                    0x43, 
                                    0x45, 
                                    0x45, 
                                    0x46, 
                                    0x47, 
                                    0x48, 
                                    0x49, 
                                    0x4A, 
                                    0x4B, 
                                    0x4C, 
                                    0x4D, 
                                    0x4E, 
                                    0x4F, 
                                    0x50, 
                                    0x51, 
                                    0x52, 
                                    0x53, 
                                    0x54, 
                                    0x55, 
                                    0x56, 
                                    0x57, 
                                    0x58, 
                                    0x59, 
                                    0x5A, 
                                    0x5B, 
                                    0x5C, 
                                    0x5D, 
                                    0x5E, 
                                    0x5F, 
                                    0x60, 
                                    0x61, 
                                    0x62, 
                                    0x63, 
                                    0x64
                                })
                            }
                        }
                    }

                    Method (_BCM, 1, Serialized)  // _BCM: Brightness Control Method
                    {
                        Store (\_SB.BCM (Arg0), Local0)
                        If (Local0)
                        {
                            Store (BRID, Local1)
                            If (LEqual (SBRV (), 0x00))
                            {
                                \_SB.SSMI (0xEA74, 0x04, Local1, 0x00, 0x00)
                            }

                            Signal (\_SB.BEVT)
                        }
                    }

                    Method (_BQC, 0, Serialized)  // _BQC: Brightness Query Current
                    {
                        Return (\_SB.BQC ())
                    }
                }

                Scope (\_GPE)
                {
                    Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        If (LEqual (\_SB.PCI0.IGPU.GIVD, 0x00))
                        {
                            If (LAnd (\_SB.PCI0.IGPU.GSSE, LNot (GSMI)))
                            {
                                \_SB.PCI0.IGPU.GSCI ()
                            }
                            Else
                            {
                                Store (0x01, SCIS) /* \SCIS */
                            }
                        }
                    }

                    Name (WOAT, 0xFF)
                    Method (CNDD, 1, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.IGPU.GIVD, 0x00))
                        {
                            If (LOr (Arg0, LNotEqual (WDST, WOAT)))
                            {
                                Store (WDST, WOAT) /* \_GPE.WOAT */
                                If (LGreaterEqual (\WCOS (), 0x04))
                                {
                                    Notify (\_SB.PCI0, 0x00) // Bus Check
                                }
                                Else
                                {
                                    Notify (\_SB.PCI0.IGPU, 0x00) // Bus Check
                                }

                                Sleep (0x02EE)
                            }
                        }
                    }

                    Method (VHIV, 3, Serialized)
                    {
                        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                        If (\_SB.PCI0.IGPU.GIVD)
                        {
                            Return (0x01)
                        }

                        While (One)
                        {
                            Store (Arg2, _T_0) /* \_GPE.VHIV._T_0 */
                            If (LEqual (_T_0, 0x01))
                            {
                                If (And (Arg0, 0x80))
                                {
                                    Notify (\_SB.PCI0.IGPU.DD02, Arg0)
                                }
                                Else
                                {
                                    Store ("Verify no OS controlled brightness b/c VideoBrightnessEvent", Debug)
                                    If (LEqual (And (WDPE, 0x44), 0x00))
                                    {
                                        Store ("VBRE method, use OpRegion method", Debug)
                                        \_SB.PCI0.IGPU.SBRV ()
                                    }
                                }
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x02))
                                {
                                    \_SB.PCI0.IGPU.GDCC (0x01)
                                    If (LEqual (And (WDPE, 0x03), 0x00))
                                    {
                                        If (And (DCAP, 0x01))
                                        {
                                            \_SB.PCI0.IGPU.DKET ()
                                        }
                                        Else
                                        {
                                            \_SB.SSMI (0xEA74, 0x06, 0x00, 0x00, 0x00)
                                            CNDD (0x00)
                                            Notify (\_SB.PCI0.IGPU, 0x80) // Status Change
                                        }
                                    }
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x03))
                                    {
                                        Store (\_SB.LID._LID (), \_SB.PCI0.IGPU.CLID)
                                        If (LOr (LLess (\WCOS (), 0x06), LEqual (And (WDPE, 0x03), 
                                            0x00)))
                                        {
                                            If (And (DCAP, 0x01))
                                            {
                                                If (\_SB.PCI0.IGPU.GLID (\_SB.LID._LID ()))
                                                {
                                                    Or (0x80000000, \_SB.PCI0.IGPU.CLID, \_SB.PCI0.IGPU.CLID)
                                                }
                                            }
                                            Else
                                            {
                                                \_SB.SSMI (0xEA74, 0x05, 0x00, 0x00, 0x00)
                                                CNDD (0x01)
                                                Notify (\_SB.PCI0.IGPU, 0x80) // Status Change
                                                If (LLess (\WCOS (), 0x06))
                                                {
                                                    Store (0x00, LRSC) /* \_GPE.LRSC */
                                                }
                                            }
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x04))
                                        {
                                            If (LEqual (And (WDPE, 0x03), 0x00))
                                            {
                                                If (And (DCAP, 0x01))
                                                {
                                                    \_SB.PCI0.IGPU.GF4E (0x00)
                                                }
                                                Else
                                                {
                                                    CNDD (0x00)
                                                    Notify (\_SB.PCI0.IGPU, 0x80) // Status Change
                                                }
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x06))
                                            {
                                                If (And (DCAP, 0x01))
                                                {
                                                    \_SB.PCI0.IGPU.SNXS ()
                                                }
                                                Else
                                                {
                                                    \_GPE.CNDD (0x00)
                                                    Notify (\_SB.PCI0.IGPU, 0x80) // Status Change
                                                }
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x07))
                                                {
                                                    \_SB.PCI0.IGPU.RFHS (Arg0)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x08))
                                                    {
                                                        If (LEqual (Arg0, 0x04))
                                                        {
                                                            \_SB.PCI0.IGPU.GLID (\_SB.LID._LID ())
                                                            \_SB.PCI0.IGPU.DKET ()
                                                        }

                                                        If (LGreaterEqual (Arg0, 0x03))
                                                        {
                                                            If (LEqual (And (WDPE, 0x44), 0x00))
                                                            {
                                                                Store (\_SB.SBRC (), Local0)
                                                                Or (Local0, 0x80000000, \_SB.PCI0.IGPU.BCLP)
                                                            }
                                                        }
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x09))
                                                        {
                                                            If (LEqual (And (WDPE, 0x04), 0x00))
                                                            {
                                                                \_SB.PCI0.IGPU.SBRV ()
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Break
                        }

                        Return (0x00)
                    }
                }

                Event (\_SB.BEVT)
                Event (\_SB.F4EV)
                Scope (\_GPE)
                {
                    Method (VHOV, 3, Serialized)
                    {
                        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                        While (One)
                        {
                            Store (Arg2, _T_0) /* \_GPE.VHOV._T_0 */
                            If (LEqual (_T_0, 0x01))
                            {
                                If (And (Arg0, 0x80))
                                {
                                    Notify (\_SB.PCI0.PEGP.DGFX.LCD, Arg0)
                                }
                                Else
                                {
                                    If (LEqual (And (WDPE, 0x44), 0x00))
                                    {
                                        \_SB.PCI0.PEGP.DGFX.SBRV ()
                                    }
                                }
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x02))
                                {
                                    \_SB.PCI0.PEGP.DGFX.GDCC (0x01)
                                    \_SB.PCI0.PEGP.DGFX.DKET ()
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x03))
                                    {
                                        \_SB.PCI0.PEGP.DGFX.GLEV ()
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x04))
                                        {
                                            If (LEqual (And (WDPE, 0x03), 0x00))
                                            {
                                                \_SB.PCI0.PEGP.DGFX.GF4E ()
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x05))
                                            {
                                                \_SB.PCI0.PEGP.DGFX.GPUP ()
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x06))
                                                {
                                                    If (And (DCAP, 0x01))
                                                    {
                                                        \_SB.PCI0.PEGP.DGFX.SNXS ()
                                                    }
                                                    Else
                                                    {
                                                        Notify (\_SB.PCI0.PEGP.DGFX, 0x80) // Status Change
                                                    }
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x07))
                                                    {
                                                        \_SB.PCI0.PEGP.DGFX.RFHS (Arg0)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x08))
                                                        {
                                                            \_SB.PCI0.PEGP.DGFX.VWAK (Arg0)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Break
                        }

                        Return (0x00)
                    }

                    Method (VBRE, 1, Serialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (Arg0, 0x00, 0x01), Local1)
                        }

                        If (Local1)
                        {
                            Store (\_GPE.VHOV (Arg0, 0x00, 0x01), Local1)
                        }
                    }

                    Method (VFN4, 0, Serialized)
                    {
                        Signal (\_SB.F4EV)
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (0x00, 0x00, 0x04), Local1)
                        }

                        If (Local1)
                        {
                            Store (\_GPE.VHOV (0x00, 0x00, 0x04), Local1)
                        }
                    }

                    Method (VDET, 0, Serialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (0x00, 0x00, 0x02), Local1)
                        }

                        If (Local1)
                        {
                            Store (\_GPE.VHOV (0x00, 0x00, 0x02), Local1)
                        }
                    }

                    Name (LRSC, 0x01)
                    Method (VLET, 0, Serialized)
                    {
                        Store (0x01, LRSC) /* \_GPE.LRSC */
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (0x00, 0x00, 0x03), Local1)
                        }

                        If (Local1)
                        {
                            Store (\_GPE.VHOV (0x00, 0x00, 0x03), Local1)
                        }

                        Return (LRSC) /* \_GPE.LRSC */
                    }

                    Method (VPUP, 2, Serialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (Arg0, Arg1, 0x05), Local1)
                        }

                        If (Local1)
                        {
                            Store (\_GPE.VHOV (Arg0, Arg1, 0x05), Local1)
                        }
                    }
                }

                Scope (\_SB)
                {
                    Method (VSDD, 1, Serialized)
                    {
                        If (And (DCAP, 0x04))
                        {
                            Return (0xFFFF)
                        }
                        Else
                        {
                            If (LEqual (And (WDPE, 0x03), 0x00))
                            {
                                Store (Arg0, WDGN) /* \WDGN */
                                Store (0x01, Local1)
                                If (Local1)
                                {
                                    Store (\_GPE.VHIV (Arg0, 0x00, 0x06), Local1)
                                }

                                If (Local1)
                                {
                                    Store (\_GPE.VHOV (Arg0, 0x00, 0x06), Local1)
                                }
                            }

                            Return (0x00)
                        }

                        Return (Zero)
                    }

                    Method (VGDD, 1, Serialized)
                    {
                        If (LAnd (And (DCAP, 0x04), Arg0))
                        {
                            Return (0xFFFF)
                        }
                        Else
                        {
                            If (And (DCAP, 0x01))
                            {
                                If (LEqual (Arg0, 0x00))
                                {
                                    Wait (\_SB.F4EV, 0x0500)
                                }

                                Store (0x01, Local1)
                                If (Local1)
                                {
                                    Store (\_GPE.VHIV (Arg0, 0x00, 0x07), Local1)
                                }

                                If (Local1)
                                {
                                    Store (\_GPE.VHOV (Arg0, 0x00, 0x07), Local1)
                                }
                            }
                            Else
                            {
                                If (Arg0)
                                {
                                    \_SB.SSMI (0xEA74, 0x02, 0x00, 0x00, 0x00)
                                }
                            }

                            Return (WDST) /* \WDST */
                        }
                    }

                    Method (VWAK, 1, Serialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (Arg0, 0x00, 0x08), Local1)
                        }

                        If (Local1)
                        {
                            Store (\_GPE.VHOV (Arg0, 0x00, 0x08), Local1)
                        }
                    }

                    Method (WBRT, 0, NotSerialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (0x00, 0x00, 0x09), Local1)
                        }

                        If (Local1)
                        {
                            Store (\_GPE.VHOV (0x00, 0x00, 0x09), Local1)
                        }
                    }
                }

                Name (DCSC, 0xFF)
                Method (GDCC, 1, Serialized)
                {
                    If (LAnd (Arg0, LEqual (DCSC, 0xFF)))
                    {
                        Store (Or (0x01, Or (0x02, 0x04)), Local0)
                        If (\_SB.DCKD ())
                        {
                            Or (Local0, 0x08, Local0)
                        }

                        Store (Local0, DCSC) /* \_SB_.PCI0.IGPU.DCSC */
                    }

                    Return (DCSC) /* \_SB_.PCI0.IGPU.DCSC */
                }

                Method (PDOS, 2, NotSerialized)
                {
                }
            }

            Device (PEGP.DGFX)
            {
                Name (_ADR, 0x00)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (_S4D, 0x03)  // _S4D: S4 Device State
                Name (INIM, 0x00)
                Name (DIDX, Package (0x09)
                {
                    0x0110, 
                    0x0100, 
                    0x0200, 
                    0x0210, 
                    0x0220, 
                    0x0230, 
                    0x0240, 
                    0x0250, 
                    0x0260
                })
                Method (DIDM, 0, Serialized)
                {
                    Return (DIDX) /* \_SB_.PCI0.PEGP.DGFX.DIDX */
                }

                Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                {
                    Name (DODS, Package (0x05)
                    {
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00
                    })
                    Or (0x00010000, DerefOf (Index (DIDX, 0x01)), Index (DODS, 0x00
                        ))
                    Or (0x00010000, DerefOf (Index (DIDX, 0x00)), Index (DODS, 0x01
                        ))
                    Or (0x00010000, DerefOf (Index (DIDX, 0x03)), Index (DODS, 0x02
                        ))
                    Or (0x00010000, DerefOf (Index (DIDX, 0x04)), Index (DODS, 0x03
                        ))
                    Or (0x00010000, DerefOf (Index (DIDX, 0x05)), Index (DODS, 0x04
                        ))
                    Return (DODS) /* \_SB_.PCI0.PEGP.DGFX._DOD.DODS */
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (0x01, INIM) /* \_SB_.PCI0.PEGP.DGFX.INIM */
                }

                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If (LEqual (INIM, 0x01))
                    {
                        Store (0x00, INIM) /* \_SB_.PCI0.PEGP.DGFX.INIM */
                    }
                }

                Name (PSBR, 0x00)
                Name (ABRI, 0xFF)
                Name (VGSD, 0x00)
                Name (BRIN, 0x00)
                Name (DEVM, Package (0x09)
                {
                    0x01, 
                    0x02, 
                    0x04, 
                    0x08, 
                    0x80, 
                    0x0200, 
                    0x0400, 
                    0x0800, 
                    0x1000
                })
                Method (ATIF, 2, Serialized)
                {
                    Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                    Or (DCAP, 0x03, DCAP) /* \DCAP */
                    While (One)
                    {
                        Store (Arg0, _T_0) /* \_SB_.PCI0.PEGP.DGFX.ATIF._T_0 */
                        If (LEqual (_T_0, 0x00))
                        {
                            Store (AFN0 (), Local0)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x01))
                            {
                                Store (AFN1 (), Local0)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x02))
                                {
                                    Store (AFN2 (), Local0)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x03))
                                    {
                                        Store (AFN3 (Arg1), Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x04))
                                        {
                                            Store (AFN4 (), Local0)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x0F))
                                            {
                                                Store (AF15 (), Local0)
                                            }
                                            Else
                                            {
                                                Store (Buffer (0x0100)
                                                    {
                                                         0x00, 0x00
                                                    }, Local0)
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }

                    Return (Local0)
                }

                Method (AFN0, 0, Serialized)
                {
                    Store (Buffer (0x0100) {}, Local0)
                    CreateWordField (Local0, 0x00, SIZE)
                    CreateWordField (Local0, 0x02, IVER)
                    CreateDWordField (Local0, 0x04, SNMK)
                    CreateDWordField (Local0, 0x08, SFBV)
                    Store (0x0C, SIZE) /* \_SB_.PCI0.PEGP.DGFX.AFN0.SIZE */
                    Store (0x01, IVER) /* \_SB_.PCI0.PEGP.DGFX.AFN0.IVER */
                    Store (0xF1, SNMK) /* \_SB_.PCI0.PEGP.DGFX.AFN0.SNMK */
                    Store (0x400F, SFBV) /* \_SB_.PCI0.PEGP.DGFX.AFN0.SFBV */
                    Return (Local0)
                }

                Method (AFN1, 0, Serialized)
                {
                    Store (Buffer (0x0100) {}, Local0)
                    CreateWordField (Local0, 0x00, SIZE)
                    CreateDWordField (Local0, 0x02, VFMK)
                    CreateDWordField (Local0, 0x06, FLAG)
                    CreateByteField (Local0, 0x0A, NOCC)
                    Store (0x0B, SIZE) /* \_SB_.PCI0.PEGP.DGFX.AFN1.SIZE */
                    Store (0x07, VFMK) /* \_SB_.PCI0.PEGP.DGFX.AFN1.VFMK */
                    Store (0x06, FLAG) /* \_SB_.PCI0.PEGP.DGFX.AFN1.FLAG */
                    Store (0xD0, NOCC) /* \_SB_.PCI0.PEGP.DGFX.AFN1.NOCC */
                    Return (Local0)
                }

                Method (AFN2, 0, Serialized)
                {
                    Store (Buffer (0x0100) {}, Local0)
                    CreateWordField (Local0, 0x00, SIZE)
                    CreateDWordField (Local0, 0x02, PBRO)
                    CreateDWordField (Local0, 0x06, FLAG)
                    CreateByteField (Local0, 0x0A, NOCC)
                    Store (0x0D, SIZE) /* \_SB_.PCI0.PEGP.DGFX.AFN2.SIZE */
                    Store (PSBR, PBRO) /* \_SB_.PCI0.PEGP.DGFX.AFN2.PBRO */
                    Store (0x00, PSBR) /* \_SB_.PCI0.PEGP.DGFX.PSBR */
                    Store (0x06, Local1)
                    While (LLess (Local1, 0x0D))
                    {
                        Store (0x00, Index (Local0, Local1))
                        Increment (Local1)
                    }

                    If (LAnd (LEqual (PBRO, 0x00), LLess (\WCOS (), 0x06)))
                    {
                        Store (\_SB.SBRC (), ABRI) /* \_SB_.PCI0.PEGP.DGFX.ABRI */
                        Store (0x80, PBRO) /* \_SB_.PCI0.PEGP.DGFX.AFN2.PBRO */
                    }

                    If (LAnd (PBRO, 0x10))
                    {
                        Store (0x02, Local2)
                        If (LEqual (\_SB.PCI0.LPCB.EC0.GACS (), 0x01))
                        {
                            If (LEqual (\_SB.PCI0.LPCB.EC0.GPID (), 0x00))
                            {
                                Store (0x01, Local2)
                            }
                            Else
                            {
                                Store (0x03, Local2)
                            }
                        }

                        Store (Local2, Index (Local0, 0x0B))
                    }

                    If (LAnd (PBRO, 0x80))
                    {
                        Store (ABRI, Index (Local0, 0x0C))
                    }

                    Return (Local0)
                }

                Method (AFN3, 1, Serialized)
                {
                    Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                    CreateWordField (Arg0, 0x00, SIZI)
                    CreateWordField (Arg0, 0x02, DISI)
                    CreateWordField (Arg0, 0x04, CDIS)
                    Store (Buffer (0x0100) {}, Local0)
                    CreateWordField (Local0, 0x00, SIZE)
                    CreateDWordField (Local0, 0x02, DISP)
                    Store (0x00, DISP) /* \_SB_.PCI0.PEGP.DGFX.AFN3.DISP */
                    Store (0x04, SIZE) /* \_SB_.PCI0.PEGP.DGFX.AFN3.SIZE */
                    While (One)
                    {
                        Store (VGSD, _T_0) /* \_SB_.PCI0.PEGP.DGFX.AFN3._T_0 */
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (TOHP (CDIS), WDST) /* \WDST */
                            Store (TOHP (DISI), WDSA) /* \WDSA */
                            Store (DISI, DISP) /* \_SB_.PCI0.PEGP.DGFX.AFN3.DISP */
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (TOAF (WDGN), DISP) /* \_SB_.PCI0.PEGP.DGFX.AFN3.DISP */
                                Store (WDGN, WDSA) /* \WDSA */
                            }
                            Else
                            {
                                If (LEqual (DISI, 0x01))
                                {
                                    Or (CDIS, 0x01, DISP) /* \_SB_.PCI0.PEGP.DGFX.AFN3.DISP */
                                }
                                Else
                                {
                                    If (And (DISI, 0x01))
                                    {
                                        And (CDIS, Not (0x01), DISP) /* \_SB_.PCI0.PEGP.DGFX.AFN3.DISP */
                                    }
                                    Else
                                    {
                                        Store (0x01, DISP) /* \_SB_.PCI0.PEGP.DGFX.AFN3.DISP */
                                    }
                                }

                                Store (TOHP (DISI), WDSA) /* \WDSA */
                                Store (TOHP (DISP), WDGN) /* \WDGN */
                            }
                        }

                        Break
                    }

                    Signal (\_SB.F4EV)
                    Store (0x00, VGSD) /* \_SB_.PCI0.PEGP.DGFX.VGSD */
                    If (BRIN)
                    {
                        SBRV ()
                        Store (0x00, BRIN) /* \_SB_.PCI0.PEGP.DGFX.BRIN */
                    }

                    Return (Local0)
                }

                Method (AFN4, 0, Serialized)
                {
                    Store (Buffer (0x0100) {}, Local0)
                    CreateWordField (Local0, 0x00, SIZE)
                    CreateByteField (Local0, 0x02, LIDS)
                    Store (0x03, SIZE) /* \_SB_.PCI0.PEGP.DGFX.AFN4.SIZE */
                    If (\_SB.LID._LID ())
                    {
                        Store (0x00, LIDS) /* \_SB_.PCI0.PEGP.DGFX.AFN4.LIDS */
                    }
                    Else
                    {
                        Store (0x01, LIDS) /* \_SB_.PCI0.PEGP.DGFX.AFN4.LIDS */
                    }

                    Return (Local0)
                }

                Method (AF15, 0, Serialized)
                {
                    Store (Buffer (0x0100) {}, Local0)
                    CreateWordField (Local0, 0x00, DNUM)
                    CreateWordField (Local0, 0x02, DSZE)
                    CreateDWordField (Local0, 0x04, FLG1)
                    CreateWordField (Local0, 0x08, BUS1)
                    CreateWordField (Local0, 0x0A, DEV1)
                    CreateDWordField (Local0, 0x0C, FLG2)
                    CreateWordField (Local0, 0x10, BUS2)
                    CreateWordField (Local0, 0x12, DEV2)
                    Store (0x02, DNUM) /* \_SB_.PCI0.PEGP.DGFX.AF15.DNUM */
                    Store (0x08, DSZE) /* \_SB_.PCI0.PEGP.DGFX.AF15.DSZE */
                    Store (0x04, FLG1) /* \_SB_.PCI0.PEGP.DGFX.AF15.FLG1 */
                    Store (0x00, BUS1) /* \_SB_.PCI0.PEGP.DGFX.AF15.BUS1 */
                    Store (0x01, DEV1) /* \_SB_.PCI0.PEGP.DGFX.AF15.DEV1 */
                    Store (0x05, FLG2) /* \_SB_.PCI0.PEGP.DGFX.AF15.FLG2 */
                    Store (0x01, BUS2) /* \_SB_.PCI0.PEGP.DGFX.AF15.BUS2 */
                    Store (0x00, DEV2) /* \_SB_.PCI0.PEGP.DGFX.AF15.DEV2 */
                    Return (Local0)
                }

                Method (DKET, 0, Serialized)
                {
                    Or (PSBR, 0x20, PSBR) /* \_SB_.PCI0.PEGP.DGFX.PSBR */
                    Notify (^, 0xD0) // Hardware-Specific
                    Return (0x01)
                }

                Method (GF4E, 0, Serialized)
                {
                    Or (PSBR, 0x01, PSBR) /* \_SB_.PCI0.PEGP.DGFX.PSBR */
                    Notify (^, 0xD0) // Hardware-Specific
                    Return (0x01)
                }

                Method (GLEV, 0, Serialized)
                {
                    Store (0x00, Local0)
                }

                Method (GPUP, 0, Serialized)
                {
                    Or (PSBR, 0x10, PSBR) /* \_SB_.PCI0.PEGP.DGFX.PSBR */
                    Notify (^, 0xD0) // Hardware-Specific
                    Return (0x01)
                }

                Method (SBRV, 0, Serialized)
                {
                    Store (\_SB.SBRC (), ABRI) /* \_SB_.PCI0.PEGP.DGFX.ABRI */
                    Or (PSBR, 0x80, PSBR) /* \_SB_.PCI0.PEGP.DGFX.PSBR */
                    Notify (^, 0xD0) // Hardware-Specific
                    Return (0x01)
                }

                Method (RFHS, 1, Serialized)
                {
                    If (Arg0)
                    {
                        Store (0x01, VGSD) /* \_SB_.PCI0.PEGP.DGFX.VGSD */
                        Reset (\_SB.F4EV)
                        GF4E ()
                    }

                    Wait (\_SB.F4EV, 0x0500)
                }

                Method (SNXS, 0, Serialized)
                {
                    Store (0x02, VGSD) /* \_SB_.PCI0.PEGP.DGFX.VGSD */
                    GF4E ()
                    Wait (\_SB.F4EV, 0x0500)
                }

                Method (VWAK, 1, Serialized)
                {
                    If (LGreaterEqual (Arg0, 0x03))
                    {
                        If (LEqual (And (WDPE, 0x44), 0x00))
                        {
                            Store (0x01, BRIN) /* \_SB_.PCI0.PEGP.DGFX.BRIN */
                        }
                    }
                }

                Method (TOHP, 1, Serialized)
                {
                    Store (0x00, Local0)
                    Store (Arg0, Local1)
                    Store (0x00, Local2)
                    While (LAnd (LLess (Local0, 0x09), Local1))
                    {
                        Store (DerefOf (Index (DEVM, Local0)), Local3)
                        If (And (Local1, Local3))
                        {
                            ShiftLeft (0x01, Local0, Local4)
                            Or (Local2, Local4, Local2)
                        }

                        And (Local1, Not (Local3), Local1)
                        Increment (Local0)
                    }

                    Return (Local2)
                }

                Method (TOAF, 1, Serialized)
                {
                    Store (0x00, Local0)
                    Store (Arg0, Local1)
                    Store (0x00, Local2)
                    While (LAnd (LLess (Local0, 0x09), Local1))
                    {
                        ShiftLeft (0x01, Local0, Local3)
                        If (And (Local1, Local3))
                        {
                            Store (DerefOf (Index (DEVM, Local0)), Local4)
                            Or (Local2, Local4, Local2)
                        }

                        And (Local1, Not (Local3), Local1)
                        Increment (Local0)
                    }

                    Return (Local2)
                }

                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    And (WDPE, 0xF8, Local0)
                    And (WDPE, 0x83, Local1)
                    Or (Local0, Arg0, WDPE) /* \WDPE */
                    If (CondRefOf (^PDOS, Local2))
                    {
                        ^PDOS (Arg0, Local1)
                    }
                }

                Device (LCD)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        Return (ADR (0x00))
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (\_SB.LID._LID ())
                        {
                            Return (DCS (0x00))
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (DGS (0x00))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        DSS (0x00, Arg0)
                    }

                    Method (_BCL, 0, Serialized)  // _BCL: Brightness Control Levels
                    {
                        If (LLessEqual (\WCOS (), 0x07))
                        {
                            Return (\_SB.BCL ())
                        }
                        Else
                        {
                            If (\_SB.PCI0.IGPU.GIVD)
                            {
                                Return (\_SB.BCL ())
                            }
                            Else
                            {
                                Return (Package (0x67)
                                {
                                    0x50, 
                                    0x32, 
                                    0x00, 
                                    0x01, 
                                    0x02, 
                                    0x03, 
                                    0x04, 
                                    0x05, 
                                    0x06, 
                                    0x07, 
                                    0x08, 
                                    0x09, 
                                    0x0A, 
                                    0x0B, 
                                    0x0C, 
                                    0x0D, 
                                    0x0E, 
                                    0x0F, 
                                    0x10, 
                                    0x11, 
                                    0x12, 
                                    0x13, 
                                    0x14, 
                                    0x15, 
                                    0x16, 
                                    0x17, 
                                    0x18, 
                                    0x19, 
                                    0x1A, 
                                    0x1B, 
                                    0x1C, 
                                    0x1D, 
                                    0x1E, 
                                    0x1F, 
                                    0x20, 
                                    0x21, 
                                    0x22, 
                                    0x23, 
                                    0x24, 
                                    0x25, 
                                    0x26, 
                                    0x27, 
                                    0x28, 
                                    0x29, 
                                    0x2A, 
                                    0x2B, 
                                    0x2C, 
                                    0x2D, 
                                    0x2E, 
                                    0x2F, 
                                    0x30, 
                                    0x31, 
                                    0x32, 
                                    0x33, 
                                    0x34, 
                                    0x35, 
                                    0x36, 
                                    0x37, 
                                    0x38, 
                                    0x39, 
                                    0x3A, 
                                    0x3B, 
                                    0x3C, 
                                    0x3D, 
                                    0x3E, 
                                    0x3F, 
                                    0x40, 
                                    0x41, 
                                    0x42, 
                                    0x43, 
                                    0x45, 
                                    0x45, 
                                    0x46, 
                                    0x47, 
                                    0x48, 
                                    0x49, 
                                    0x4A, 
                                    0x4B, 
                                    0x4C, 
                                    0x4D, 
                                    0x4E, 
                                    0x4F, 
                                    0x50, 
                                    0x51, 
                                    0x52, 
                                    0x53, 
                                    0x54, 
                                    0x55, 
                                    0x56, 
                                    0x57, 
                                    0x58, 
                                    0x59, 
                                    0x5A, 
                                    0x5B, 
                                    0x5C, 
                                    0x5D, 
                                    0x5E, 
                                    0x5F, 
                                    0x60, 
                                    0x61, 
                                    0x62, 
                                    0x63, 
                                    0x64
                                })
                            }
                        }
                    }

                    Method (_BCM, 1, Serialized)  // _BCM: Brightness Control Method
                    {
                        Store (\_SB.BCM (Arg0), Local0)
                        If (Local0)
                        {
                            Store (BRID, Local1)
                            If (LEqual (SBRV (), 0x00))
                            {
                                \_SB.SSMI (0xEA74, 0x04, Local1, 0x00, 0x00)
                            }

                            Signal (\_SB.BEVT)
                        }
                    }

                    Method (_BQC, 0, Serialized)  // _BQC: Brightness Query Current
                    {
                        Return (\_SB.BQC ())
                    }
                }

                Device (CRT)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        Return (ADR (0x01))
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (DCS (0x01))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (DGS (0x01))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        DSS (0x01, Arg0)
                    }
                }

                Device (TV)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        Return (ADR (0x02))
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (DCS (0x02))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (DGS (0x02))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        DSS (0x02, Arg0)
                    }
                }

                Device (DVI)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        Return (ADR (0x03))
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (DCS (0x03))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (DGS (0x03))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        DSS (0x03, Arg0)
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        Return (ADR (0x04))
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (DCS (0x04))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (DGS (0x04))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        DSS (0x04, Arg0)
                    }
                }

                Device (DD05)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        Return (ADR (0x05))
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (DCS (0x05))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (DGS (0x05))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        DSS (0x05, Arg0)
                    }
                }

                Device (DD06)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        Return (ADR (0x06))
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (DCS (0x06))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (DGS (0x06))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        DSS (0x06, Arg0)
                    }
                }

                Device (DD07)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        Return (ADR (0x07))
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (DCS (0x07))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (DGS (0x07))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        DSS (0x07, Arg0)
                    }
                }

                Device (DD08)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        Return (ADR (0x08))
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (DCS (0x08))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (DGS (0x08))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        DSS (0x08, Arg0)
                    }
                }

                Method (ADR, 1, Serialized)
                {
                    Store (DIDM (), Local1)
                    Store (SizeOf (Local1), Local2)
                    If (LLess (Arg0, Local2))
                    {
                        Store (DerefOf (Index (Local1, Arg0)), Local0)
                        If (LLess (\WCOS (), 0x06))
                        {
                            And (Local0, 0xFFFF, Local0)
                        }
                    }
                    Else
                    {
                        Store (0x00, Local0)
                    }

                    Return (Local0)
                }

                Method (DCS, 1, Serialized)
                {
                    ShiftLeft (0x01, Arg0, Local1)
                    Store (0x00, Local0)
                    If (And (GDCC (0x00), Local1))
                    {
                        Store (0x01, Local0)
                        If (And (WDST, Local1))
                        {
                            Store (0x1D, Local0)
                            If (And (WDSA, Local1))
                            {
                                Store (0x1F, Local0)
                            }
                        }
                    }

                    Return (Local0)
                }

                Method (DGS, 1, Serialized)
                {
                    ShiftLeft (0x01, Arg0, Local2)
                    Store (0x00, Local0)
                    If (And (WDGN, Local2))
                    {
                        Store (0x01, Local0)
                    }

                    Return (Local0)
                }

                Method (DSS, 2, Serialized)
                {
                    ShiftLeft (0x01, Arg0, Local1)
                    Store (WDSS, Local0)
                    If (And (Arg1, 0x01))
                    {
                        Or (Local0, Local1, Local0)
                    }
                    Else
                    {
                        And (Local0, Not (Local1), Local0)
                    }

                    Store (Local0, WDSS) /* \WDSS */
                    If (And (Arg1, 0x40000000))
                    {
                        Store (Local0, WDSA) /* \WDSA */
                    }
                }

                OperationRegion (VIDR, PCI_Config, 0x00, 0xF0)
                Field (VIDR, WordAcc, NoLock, Preserve)
                {
                    VVID,   16, 
                    Offset (0x0B), 
                    LNKV,   8
                }

                Name (DCSC, 0xFF)
                Method (GDCC, 1, Serialized)
                {
                    If (LAnd (Arg0, LEqual (DCSC, 0xFF)))
                    {
                        Store (Or (0x01, Or (0x02, 0x04)), Local0)
                        If (\_SB.DCKD ())
                        {
                            Or (Local0, 0x08, Local0)
                        }

                        Store (Local0, DCSC) /* \_SB_.PCI0.PEGP.DGFX.DCSC */
                    }

                    Return (DCSC) /* \_SB_.PCI0.PEGP.DGFX.DCSC */
                }

                Method (PDOS, 2, NotSerialized)
                {
                }
            }

            Scope (\)
            {
                OperationRegion (IO_T, SystemIO, 0x1000, 0x10)
                Field (IO_T, ByteAcc, NoLock, Preserve)
                {
                    TRPI,   16, 
                    Offset (0x04), 
                    Offset (0x06), 
                    Offset (0x08), 
                    TRP0,   8, 
                    Offset (0x0A), 
                    Offset (0x0B), 
                    Offset (0x0C), 
                    Offset (0x0D), 
                    Offset (0x0E), 
                    Offset (0x0F), 
                    Offset (0x10)
                }

                OperationRegion (IO_D, SystemIO, 0x0810, 0x04)
                Field (IO_D, ByteAcc, NoLock, Preserve)
                {
                    TRPD,   8
                }

                OperationRegion (IO_H, SystemIO, 0x1000, 0x04)
                Field (IO_H, ByteAcc, NoLock, Preserve)
                {
                    TRPH,   8
                }

                OperationRegion (PMIO, SystemIO, 0x0400, 0x80)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x20), 
                        ,   2, 
                    SPST,   1, 
                        ,   16, 
                    GPS3,   1, 
                    Offset (0x42), 
                        ,   1, 
                    GPEC,   1, 
                    Offset (0x64), 
                        ,   9, 
                    SCIS,   1, 
                    Offset (0x66)
                }

                OperationRegion (GPIO, SystemIO, 0x0500, 0x64)
                Field (GPIO, ByteAcc, NoLock, Preserve)
                {
                    GU00,   8, 
                    GU01,   8, 
                    GU02,   8, 
                    GU03,   8, 
                    GIO0,   8, 
                    GIO1,   8, 
                    GIO2,   8, 
                    GIO3,   8, 
                    Offset (0x0C), 
                    GL00,   8, 
                    GL01,   8, 
                    GL02,   8, 
                        ,   3, 
                    GP27,   1, 
                    GP28,   1, 
                    Offset (0x10), 
                    Offset (0x18), 
                    GB00,   8, 
                    GB01,   8, 
                    GB02,   8, 
                    GB03,   8, 
                    Offset (0x2C), 
                    GIV0,   8, 
                    GIV1,   8, 
                    GIV2,   8, 
                    GIV3,   8, 
                    GU04,   8, 
                    GU05,   8, 
                    GU06,   8, 
                    GU07,   8, 
                    GIO4,   8, 
                    GIO5,   8, 
                    GIO6,   8, 
                    GIO7,   8, 
                        ,   5, 
                        ,   1, 
                    Offset (0x39), 
                    GL05,   8, 
                    GL06,   8, 
                    GL07,   8, 
                    Offset (0x40), 
                    GU08,   8, 
                    GU09,   8, 
                    GU0A,   8, 
                    GU0B,   8, 
                        ,   5, 
                    GI69,   1, 
                        ,   1, 
                    GI71,   1, 
                    GIO9,   8, 
                    GIOA,   8, 
                    GIOB,   8, 
                        ,   5, 
                    GL69,   1, 
                        ,   1, 
                    GL71,   1, 
                    GL09,   8, 
                    GL0A,   8, 
                    GL0B,   8
                }

                OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
                Field (RCRB, DWordAcc, Lock, Preserve)
                {
                    Offset (0x1A8), 
                    APMC,   2, 
                    Offset (0x1000), 
                    Offset (0x3000), 
                    Offset (0x3404), 
                    HPAS,   2, 
                        ,   5, 
                    HPAE,   1, 
                    Offset (0x3418), 
                        ,   1, 
                        ,   1, 
                    SATD,   1, 
                    SMBD,   1, 
                    HDAD,   1, 
                    Offset (0x341A), 
                    RP1D,   1, 
                    RP2D,   1, 
                    RP3D,   1, 
                    RP4D,   1, 
                    RP5D,   1, 
                    RP6D,   1, 
                    RP7D,   1, 
                    RP8D,   1
                }

                Method (GETP, 1, Serialized)
                {
                    If (LEqual (And (Arg0, 0x09), 0x00))
                    {
                        Return (0xFFFFFFFF)
                    }

                    If (LEqual (And (Arg0, 0x09), 0x08))
                    {
                        Return (0x0384)
                    }

                    ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
                    ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
                    Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
                        ))
                }

                Method (GDMA, 5, Serialized)
                {
                    If (Arg0)
                    {
                        If (LAnd (Arg1, Arg4))
                        {
                            Return (0x14)
                        }

                        If (LAnd (Arg2, Arg4))
                        {
                            Return (Multiply (Subtract (0x04, Arg3), 0x0F))
                        }

                        Return (Multiply (Subtract (0x04, Arg3), 0x1E))
                    }

                    Return (0xFFFFFFFF)
                }

                Method (GETT, 1, Serialized)
                {
                    Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
                        ), 0x03), And (Arg0, 0x03)))))
                }

                Method (GETF, 3, Serialized)
                {
                    Name (TMPF, 0x00)
                    If (Arg0)
                    {
                        Or (TMPF, 0x01, TMPF) /* \GETF.TMPF */
                    }

                    If (And (Arg2, 0x02))
                    {
                        Or (TMPF, 0x02, TMPF) /* \GETF.TMPF */
                    }

                    If (Arg1)
                    {
                        Or (TMPF, 0x04, TMPF) /* \GETF.TMPF */
                    }

                    If (And (Arg2, 0x20))
                    {
                        Or (TMPF, 0x08, TMPF) /* \GETF.TMPF */
                    }

                    If (And (Arg2, 0x4000))
                    {
                        Or (TMPF, 0x10, TMPF) /* \GETF.TMPF */
                    }

                    Return (TMPF) /* \GETF.TMPF */
                }

                Method (SETP, 3, Serialized)
                {
                    If (LGreater (Arg0, 0xF0))
                    {
                        Return (0x08)
                    }
                    Else
                    {
                        If (And (Arg1, 0x02))
                        {
                            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                            {
                                Return (0x2301)
                            }

                            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                            {
                                Return (0x2101)
                            }
                        }

                        Return (0x1001)
                    }
                }

                Method (SDMA, 1, Serialized)
                {
                    If (LLessEqual (Arg0, 0x14))
                    {
                        Return (0x01)
                    }

                    If (LLessEqual (Arg0, 0x1E))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x2D))
                    {
                        Return (0x01)
                    }

                    If (LLessEqual (Arg0, 0x3C))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x5A))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SETT, 3, Serialized)
                {
                    If (And (Arg1, 0x02))
                    {
                        If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                        {
                            Return (0x0B)
                        }

                        If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                        {
                            Return (0x09)
                        }
                    }

                    Return (0x04)
                }
            }

            Device (LANC)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Name(_PRW, Package() { 0x0D, 0 })
                
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                OperationRegion (HDAR, PCI_Config, 0x4C, 0x10)
                Field (HDAR, WordAcc, NoLock, Preserve)
                {
                    DCKA,   1, 
                    Offset (0x01), 
                    DCKM,   1, 
                        ,   6, 
                    DCKS,   1, 
                    Offset (0x08), 
                        ,   15, 
                    PMES,   1
                }
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Return (Package()
                    {
                        "hda-gfx", Buffer() { "onboard-1" },
                        "layout-id", Buffer() { 0x0C, 0x00, 0x00, 0x00 },
                        "PinConfigurations", Buffer() { },
                        //"MaximumBootBeepVolume", 77,
                    })
                }
            }

            Device (EH01)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                OperationRegion (EHCX, PCI_Config, 0x54, 0x30)
                Field (EHCX, AnyAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1, 
                    Offset (0x0E), 
                    PIMP,   1, 
                    PMSK,   8, 
                    Offset (0x2E), 
                        ,   1, 
                    RMH1,   1
                }

                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If (LAnd (LEqual (Arg0, 0x02), LEqual (Arg1, 0x01)))
                    {
                        Store (0x01, PMSK) /* \_SB_.PCI0.EH01.PMSK */
                        Store (0x01, PIMP) /* \_SB_.PCI0.EH01.PIMP */
                    }
                }

                Device (RHUB)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Device (PRT0)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                    }

                    Device (PRT1)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }
                }

                

                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S4D, 0x03)  // _S4D: S4 Device State
                Scope (RHUB.PRT0)
                {
                    Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                    {
                        Return (EUPC) /* \EUPC */
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Device (HPT0)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                    }

                    Device (HPT1)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }

                    Device (HPT2)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                    }

                    Device (HPT3)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                    }

                    Device (HPT4)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Method (_EJD, 0, NotSerialized)  // _EJD: Ejection Dependent Device
                        {
                            Return ("\\_SB.PCI0.RP02.ECF0")
                        }
                    }

                    Device (HPT5)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (EUPC) /* \EUPC */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (EPLD) /* \EPLD */
                        }
                    }

                    Device (HPT6)
                    {
                        Name (_ADR, 0x07)  // _ADR: Address
                    }

                    Device (HPT7)
                    {
                        Name (_ADR, 0x08)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (EUPC) /* \EUPC */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (EPLD) /* \EPLD */
                        }
                    }
                }
                
                Name(_PRW, Package() { 0x0D, 0 })
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Return (Package()
                    {
                        "AAPL,clock-id", Buffer() { 0x01 },
                        "subsystem-id", Buffer() { 0x70, 0x72, 0x00, 0x00 },
                        "subsystem-vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
                        "AAPL,current-available", 2100,
                        "AAPL,current-extra", 2200,
                        "AAPL,current-extra-in-sleep", 1600,
                        "AAPL,device-internal", 0x02,
                        "AAPL,max-port-current-in-sleep", 2100,
                    })
                }
            }

            Device (EH02)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                OperationRegion (EHCX, PCI_Config, 0x54, 0x30)
                Field (EHCX, AnyAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1, 
                    Offset (0x0E), 
                    PIMP,   1, 
                    PMSK,   8, 
                    Offset (0x2E), 
                        ,   1, 
                    RMH1,   1
                }

                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If (LAnd (LEqual (Arg0, 0x02), LEqual (Arg1, 0x01)))
                    {
                        Store (0x01, PMSK) /* \_SB_.PCI0.EH02.PMSK */
                        Store (0x01, PIMP) /* \_SB_.PCI0.EH02.PIMP */
                    }
                }

                Device (RHUB)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Device (PRT0)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                    }

                    Device (PRT1)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }
                }

                

                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S4D, 0x03)  // _S4D: S4 Device State
                Scope (RHUB.PRT0)
                {
                    Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                    {
                        Return (EUPC) /* \EUPC */
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Device (HPT0)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (EUPC) /* \EUPC */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (EPLD) /* \EPLD */
                        }
                    }

                    Device (HPT1)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }

                    Device (HPT2)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            If (\_OSI ("Windows 2012"))
                            {
                                Return (Package (0x04)
                                {
                                    0x00, 
                                    0xFF, 
                                    0x00, 
                                    0x00
                                })
                            }
                            Else
                            {
                                Return (EUPC) /* \EUPC */
                            }
                        }

                        Device (CAM0)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x25, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                    /*           Revision : 02     */
                                    /*        IgnoreColor : 01     */
                                    /*              Color : 000000 */
                                    /*              Width : 0000   */
                                    /*             Height : 0000   */
                                    /*        UserVisible : 01     */
                                    /*               Dock : 00     */
                                    /*                Lid : 01     */
                                    /*              Panel : 04     */
                                    /*   VerticalPosition : 00     */
                                    /* HorizontalPosition : 01     */
                                    /*              Shape : 07     */
                                    /*   GroupOrientation : 00     */
                                    /*         GroupToken : 00     */
                                    /*      GroupPosition : 00     */
                                    /*                Bay : 00     */
                                    /*          Ejectable : 00     */
                                    /*  OspmEjectRequired : 00     */
                                    /*      CabinetNumber : 00     */
                                    /*     CardCageNumber : 00     */
                                    /*          Reference : 00     */
                                    /*           Rotation : 00     */
                                    /*              Order : 00     */
                                    /*     VerticalOffset : FFFF   */
                                    /*   HorizontalOffset : FFFF   */
                                }
                            })
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            If (\_OSI ("Windows 2012"))
                            {
                                Return (Package (0x00) {})
                            }
                            Else
                            {
                                Return (EPLD) /* \EPLD */
                            }
                        }
                    }

                    Device (HPT3)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                    }

                    Device (HPT4)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (EUPC) /* \EUPC */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (EPLD) /* \EPLD */
                        }
                    }

                    Device (HPT5)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                    }
                }
                
                Name(_PRW, Package() { 0x0D, 0 })
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Return (Package()
                    {
                        "AAPL,clock-id", Buffer() { 0x01 },
                        "subsystem-id", Buffer() { 0x70, 0x72, 0x00, 0x00 },
                        "subsystem-vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
                        "AAPL,current-available", 2100,
                        "AAPL,current-extra", 2200,
                        "AAPL,current-extra-in-sleep", 1600,
                        "AAPL,device-internal", 0x02,
                        "AAPL,max-port-current-in-sleep", 2100,
                    })
                }
            }

            Device (XHC)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                OperationRegion (XPRT, PCI_Config, 0x74, 0x6C)
                Field (XPRT, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x01), 
                    PMEE,   1, 
                        ,   6, 
                    PMES,   1, 
                    Offset (0x5C), 
                    PR2,    32, 
                    PR2M,   32, 
                    PR3,    32, 
                    PR3M,   32
                }

                Name (XRST, Zero)
                Method (CUID, 1, Serialized)
                {
                    If (LEqual (Arg0, Buffer (0x10)
                            {
                                /* 0000 */   0xA9, 0x12, 0x95, 0x7C, 0x05, 0x17, 0xB4, 0x4C,
                                /* 0008 */   0xAF, 0x7D, 0x50, 0x6A, 0x24, 0x23, 0xAB, 0x71
                            }))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (POSC, 3, Serialized)
                {
                    CreateDWordField (Arg2, 0x00, CDW1)
                    CreateDWordField (Arg2, 0x08, CDW3)
                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1) /* \_SB_.PCI0.XHC_.POSC.CDW1 */
                    }

                    If (LEqual (XHCI, 0x00))
                    {
                        Or (CDW1, 0x02, CDW1) /* \_SB_.PCI0.XHC_.POSC.CDW1 */
                    }

                    If (LNot (And (CDW1, 0x01)))
                    {
                        If (And (CDW3, 0x01))
                        {
                            ESEL ()
                        }
                        Else
                        {
                            XSEL ()
                        }
                    }

                    Return (Arg2)
                }

                Method (XSEL, 0, Serialized)
                {
                    If (LOr (LEqual (XHCI, 0x02), LEqual (XHCI, 0x03)))
                    {
                        Store (0x01, XUSB) /* \_SB_.XUSB */
                        Store (0x01, XRST) /* \_SB_.PCI0.XHC_.XRST */
                        Store (0x00, Local0)
                        And (PR3, 0xFFFFFFF0, Local0)
                        Or (Local0, XHPM, Local0)
                        And (Local0, PR3M, PR3) /* \_SB_.PCI0.XHC_.PR3_ */
                        Store (0x00, Local0)
                        And (PR2, 0xFFFFFFF0, Local0)
                        Or (Local0, XHPM, Local0)
                        And (Local0, PR2M, PR2) /* \_SB_.PCI0.XHC_.PR2_ */
                    }
                }

                Method (ESEL, 0, Serialized)
                {
                    If (LOr (LEqual (XHCI, 0x02), LEqual (XHCI, 0x03)))
                    {
                        And (PR3, 0xFFFFFFF0, PR3) /* \_SB_.PCI0.XHC_.PR3_ */
                        And (PR2, 0xFFFFFFF0, PR2) /* \_SB_.PCI0.XHC_.PR2_ */
                        Store (0x00, XUSB) /* \_SB_.XUSB */
                        Store (0x00, XRST) /* \_SB_.PCI0.XHC_.XRST */
                    }
                }

                

                Method (XWAK, 0, Serialized)
                {
                    If (LOr (LEqual (XUSB, 0x01), LEqual (XRST, 0x01)))
                    {
                        XSEL ()
                    }
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }

                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (HSP1)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR2, 0x01)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HSP1._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR2, 0x01)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.HSP1._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HSP1._PLD.PLDP */
                        }
                    }

                    Device (HSP2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR2, 0x02)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HSP2._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR2, 0x02)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.HSP2._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HSP2._PLD.PLDP */
                        }
                    }

                    Device (HSP3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR2, 0x04)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HSP3._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR2, 0x04)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.HSP3._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HSP3._PLD.PLDP */
                        }
                    }

                    Device (HSP4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR2, 0x08)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HSP4._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR2, 0x08)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.HSP4._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HSP4._PLD.PLDP */
                        }
                    }

                    Device (SSP1)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR3, 0x01)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SSP1._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR3, 0x01)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.SSP1._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SSP1._PLD.PLDP */
                        }
                    }

                    Device (SSP2)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR3, 0x02)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SSP2._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR3, 0x02)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.SSP2._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SSP2._PLD.PLDP */
                        }
                    }

                    Device (SSP3)
                    {
                        Name (_ADR, 0x07)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR3, 0x04)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SSP3._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR3, 0x04)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.SSP3._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SSP3._PLD.PLDP */
                        }
                    }

                    Device (SSP4)
                    {
                        Name (_ADR, 0x08)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR3, 0x08)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SSP4._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR3, 0x08)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.SSP4._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SSP4._PLD.PLDP */
                        }
                    }
                }
                
                Name(_PRW, Package() { 0x0D, 0 })
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Return (Package()
                    {
                        "subsystem-id", Buffer() { 0x70, 0x72, 0x00, 0x00 },
                        "subsystem-vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
                        "AAPL,current-available", 2100,
                        "AAPL,current-extra", 2200,
                        "AAPL,current-extra-in-sleep", 1600,
                        "AAPL,device-internal", 0x00,
                        "AAPL,max-port-current-in-sleep", 2100,
                    })
                }
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0B, 
                    0x05
                })
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Scope (\_SB)
                {
                    OperationRegion (\_SB.PCI0.LPCB.LPC1, PCI_Config, 0x40, 0xC0)
                    Field (\_SB.PCI0.LPCB.LPC1, AnyAcc, NoLock, Preserve)
                    {
                        Offset (0x20), 
                        PARC,   8, 
                        PBRC,   8, 
                        PCRC,   8, 
                        PDRC,   8, 
                        Offset (0x28), 
                        PERC,   8, 
                        PFRC,   8, 
                        PGRC,   8, 
                        PHRC,   8, 
                        Offset (0x6C), 
                        Offset (0x6D), 
                        Offset (0x6E), 
                        XUSB,   1
                    }

                    Device (LNKA)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x01)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PARC, 0x80, PARC) /* \_SB_.PARC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLA, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y16)
                                    {}
                            })
                            CreateWordField (RTLA, \_SB.LNKA._CRS._Y16._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKA._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PARC, 0x0F), IRQ0) /* \_SB_.LNKA._CRS.IRQ0 */
                            Return (RTLA) /* \_SB_.LNKA._CRS.RTLA */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PARC) /* \_SB_.PARC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PARC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKB)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x02)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PBRC, 0x80, PBRC) /* \_SB_.PBRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLB, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y17)
                                    {}
                            })
                            CreateWordField (RTLB, \_SB.LNKB._CRS._Y17._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKB._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PBRC, 0x0F), IRQ0) /* \_SB_.LNKB._CRS.IRQ0 */
                            Return (RTLB) /* \_SB_.LNKB._CRS.RTLB */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PBRC) /* \_SB_.PBRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PBRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKC)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x03)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PCRC, 0x80, PCRC) /* \_SB_.PCRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLC, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y18)
                                    {}
                            })
                            CreateWordField (RTLC, \_SB.LNKC._CRS._Y18._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKC._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PCRC, 0x0F), IRQ0) /* \_SB_.LNKC._CRS.IRQ0 */
                            Return (RTLC) /* \_SB_.LNKC._CRS.RTLC */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PCRC) /* \_SB_.PCRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PCRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKD)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x04)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PDRC, 0x80, PDRC) /* \_SB_.PDRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLD, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y19)
                                    {}
                            })
                            CreateWordField (RTLD, \_SB.LNKD._CRS._Y19._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKD._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PDRC, 0x0F), IRQ0) /* \_SB_.LNKD._CRS.IRQ0 */
                            Return (RTLD) /* \_SB_.LNKD._CRS.RTLD */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PDRC) /* \_SB_.PDRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PDRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKE)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x05)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PERC, 0x80, PERC) /* \_SB_.PERC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLE, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y1A)
                                    {}
                            })
                            CreateWordField (RTLE, \_SB.LNKE._CRS._Y1A._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKE._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PERC, 0x0F), IRQ0) /* \_SB_.LNKE._CRS.IRQ0 */
                            Return (RTLE) /* \_SB_.LNKE._CRS.RTLE */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PERC) /* \_SB_.PERC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PERC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKF)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x06)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PFRC, 0x80, PFRC) /* \_SB_.PFRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLF, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y1B)
                                    {}
                            })
                            CreateWordField (RTLF, \_SB.LNKF._CRS._Y1B._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKF._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PFRC, 0x0F), IRQ0) /* \_SB_.LNKF._CRS.IRQ0 */
                            Return (RTLF) /* \_SB_.LNKF._CRS.RTLF */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PFRC) /* \_SB_.PFRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PFRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKG)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x07)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PGRC, 0x80, PGRC) /* \_SB_.PGRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLG, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y1C)
                                    {}
                            })
                            CreateWordField (RTLG, \_SB.LNKG._CRS._Y1C._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKG._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PGRC, 0x0F), IRQ0) /* \_SB_.LNKG._CRS.IRQ0 */
                            Return (RTLG) /* \_SB_.LNKG._CRS.RTLG */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PGRC) /* \_SB_.PGRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PGRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKH)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x08)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PHRC, 0x80, PHRC) /* \_SB_.PHRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLH, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y1D)
                                    {}
                            })
                            CreateWordField (RTLH, \_SB.LNKH._CRS._Y1D._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKH._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PHRC, 0x0F), IRQ0) /* \_SB_.LNKH._CRS.IRQ0 */
                            Return (RTLH) /* \_SB_.LNKH._CRS.RTLH */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PHRC) /* \_SB_.PHRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PHRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }
                }

                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                    Offset (0xB0), 
                    RAEN,   1, 
                        ,   13, 
                    RCBA,   18
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))  // _HID: Hardware ID
                    Name (_UID, 0x01)  // _UID: Unique ID
                    Name (_GPE, 0x16)  // _GPE: General Purpose Events
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Mutex (ECMX, 0x00)
                    Name (ECRG, 0x00)
                    Name (HSWK, 0x00)
                    Method (ECRI, 0, Serialized)
                    {
                        Store (\WCOS (), OST) /* \_SB_.PCI0.LPCB.EC0_.OST_ */
                        PWUP (0x07, 0xFF)
                        Store (GBAP (), Local0)
                        ITLB ()
                        SBTN (Local0, 0x81)
                        PRIT ()
                    }

                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECRG) /* \_SB_.PCI0.LPCB.EC0_.ECRG */
                            Store (LOr (LEqual (\WCOS (), 0x01), LEqual (\WCOS (), 0x02)), Local1)
                            If (LAnd (Arg1, LNot (Local1)))
                            {
                                ECRI ()
                            }
                        }
                    }

                    OperationRegion (ECRM, EmbeddedControl, 0x00, 0xFF)
                    Field (ECRM, ByteAcc, NoLock, Preserve)
                    {
                        PMCD,   32, 
                        S0FL,   8, 
                        SXF0,   8, 
                        SXF1,   8, 
                        CPWR,   16, 
                        CVLT,   16, 
                        CCUR,   16, 
                        DIDX,   8, 
                        CIDX,   8, 
                        PMCC,   8, 
                        PMEP,   8, 
                        Offset (0x22), 
                        CRZN,   8, 
                        THTA,   8, 
                        HYST,   8, 
                        CRIT,   8, 
                        TEMP,   8, 
                        TENA,   8, 
                        Offset (0x29), 
                        TOAD,   8, 
                        PHTP,   8, 
                        THEM,   8, 
                        TMPO,   8, 
                        Offset (0x2E), 
                        FRDC,   8, 
                        FTGC,   8, 
                        PLTP,   8, 
                        Offset (0x32), 
                        DTMP,   8, 
                        Offset (0x35), 
                        PL1,    8, 
                        PL2,    8, 
                        BCVD,   8, 
                        Offset (0x40), 
                        ABDI,   8, 
                        ABAD,   8, 
                        ABIX,   8, 
                        ABDA,   8, 
                        ABST,   8, 
                        PORI,   8, 
                        Offset (0x4C), 
                        PSSB,   8, 
                        Offset (0x80), 
                        Offset (0x81), 
                            ,   4, 
                        SLPT,   4, 
                        FNSW,   1, 
                        SFNC,   1, 
                        ACPI,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        DETF,   1, 
                        LIDS,   1, 
                        TBLT,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        COMM,   1, 
                        PME,    1, 
                        SBVD,   1, 
                        ADP,    1, 
                        ADID,   2, 
                        LCTV,   1, 
                        BATP,   4, 
                        BPU,    1, 
                        Offset (0x86), 
                        BSEL,   4, 
                        Offset (0x87), 
                        LB1,    8, 
                        LB2,    8, 
                        BDC0, 8, BDC1, 8, 
                        Offset (0x8D), 
                        BFC0, 8, BFC1, 8, 
                        RTE0, 8, RTE1, 8, 
                        BTC,    1, 
                        Offset (0x92), 
                        BME0, 8, BME1, 8, 
                        BDN,    8, 
                        BDV0, 8, BDV1, 8, 
                        BCX0, 8, BCX1, 8, 
                        BST,    4, 
                        Offset (0x9B), 
                        ATE0, 8, ATE1, 8, 
                        BPR0, 8, BPR1, 8, 
                        BCR0, 8, BCR1, 8, 
                        BRC0, 8, BRC1, 8, 
                        BCC0, 8, BCC1, 8, 
                        BPV0, 8, BPV1, 8, 
                        BCA0, 8, BCA1, 8, 
                        BCB0, 8, BCB1, 8, 
                        BCP0, 8, BCP1, 8, 
                        BCW,    16, 
                        ATF0, 8, ATF1, 8, 
                        BCL,    16, 
                        AXC0, 8, AXC1, 8, 
                        BCG1,   8, 
                        BT1I,   1, 
                        BT2I,   1, 
                            ,   2, 
                        BATN,   4, 
                        BST0, 8, BST1, 8, 
                        BCG2,   8, 
                        Offset (0xBD), 
                        BMO,    8, 
                        Offset (0xBF), 
                        BRCV,   8, 
                        Offset (0xC1), 
                        BIF,    8, 
                        BRCC,   8, 
                        Offset (0xC9), 
                        BSN0, 8, BSN1, 8, 
                        BDA0, 8, BDA1, 8, 
                        BMF,    8, 
                        Offset (0xCF), 
                        CTLB,   8, 
                        Offset (0xD1), 
                        BTY,    8, 
                        Offset (0xD5), 
                        MFAC,   8, 
                        CFAN,   8, 
                        PFAN,   8, 
                        OCPS,   8, 
                        OCPR,   8, 
                        OCPE,   8, 
                        TMP1,   8, 
                        TMP2,   8, 
                        NABT,   4, 
                        BCM,    4, 
                        CCBQ,   16, 
                        CBT0, 8, CBT1, 8, 
                        Offset (0xE3), 
                        OST,    4, 
                        Offset (0xE4), 
                        Offset (0xE5), 
                        TPTE,   1, 
                        TBBN,   1, 
                            ,   3, 
                        TP,     1, 
                        Offset (0xE6), 
                        SHK,    8, 
                        AUDS,   1, 
                        SPKR,   1, 
                        Offset (0xE8), 
                        HSEN,   4, 
                        HSST,   4, 
                        Offset (0xEA), 
                            ,   2, 
                        WWP,    1, 
                        WLP,    1, 
                        Offset (0xEC), 
                            ,   7, 
                        TBOS,   1, 
                        Offset (0xEF), 
                        INCH,   2, 
                        IDIS,   2, 
                        INAC,   1
                    }

                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        If (LOr (LEqual (\WCOS (), 0x01), LEqual (\WCOS (), 0x02)))
                        {
                            ECRI ()
                        }
                    }

                    OperationRegion (MAIO, SystemIO, 0x0200, 0x02)
                    Field (MAIO, ByteAcc, NoLock, Preserve)
                    {
                        MAIN,   8, 
                        MADT,   8
                    }

                    IndexField (MAIN, MADT, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x8C), 
                            ,   7, 
                        CLID,   1, 
                        Offset (0x95), 
                        PWM0,   8, 
                        Offset (0x9D), 
                        PWMC,   8
                    }

                    Method (KFCL, 2, NotSerialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg1, MFAC) /* \_SB_.PCI0.LPCB.EC0_.MFAC */
                            If (LAnd (LGreaterEqual (Arg0, 0x00), LLessEqual (Arg0, 0x64)))
                            {
                                Store (Arg0, CFAN) /* \_SB_.PCI0.LPCB.EC0_.CFAN */
                            }
                        }

                        Release (ECMX)
                    }

                    Method (KSFS, 1, NotSerialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, CFAN) /* \_SB_.PCI0.LPCB.EC0_.CFAN */
                        }

                        Release (ECMX)
                    }

                    Method (KGFS, 0, NotSerialized)
                    {
                        Store (0x14, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (CFAN, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (KRFS, 0, NotSerialized)
                    {
                        Store (0x1E, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (PFAN, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (SFSD, 1, Serialized)
                    {
                        Multiply (Arg0, 0x40, Local1)
                        Divide (Local1, 0x64, Local2, Local0)
                        Subtract (0x40, Local0, Local0)
                        And (PWM0, 0x80, Local1)
                        If (LEqual (Local0, 0x40))
                        {
                            Or (Local1, 0x01, Local1)
                        }
                        Else
                        {
                            ShiftLeft (Local0, 0x01, Local0)
                            Or (Local0, Local1, Local1)
                        }

                        Store (Local1, PWM0) /* \_SB_.PCI0.LPCB.EC0_.PWM0 */
                    }

                    Method (GFSD, 0, Serialized)
                    {
                        And (PWM0, 0x7F, Local0)
                        If (And (Local0, 0x01))
                        {
                            Store (0x00, Local1)
                        }
                        Else
                        {
                            ShiftRight (Local0, 0x01, Local0)
                            Subtract (0x40, Local0, Local0)
                            Multiply (Local0, 0x64, Local0)
                            Divide (Add (Local0, 0x20), 0x40, Local2, Local1)
                            Increment (Local1)
                        }

                        Return (Local1)
                    }

                    Method (GSHK, 0, Serialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (SHK, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (SSHK, 1, Serialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, Debug)
                            Store (Arg0, SHK) /* \_SB_.PCI0.LPCB.EC0_.SHK_ */
                        }

                        Release (ECMX)
                    }

                    Method (SAST, 1, Serialized)
                    {
                        Store (0x00, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, AUDS) /* \_SB_.PCI0.LPCB.EC0_.AUDS */
                            Store (0x01, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (HSPW, 2, Serialized)
                    {
                        If (HSED)
                        {
                            Store (HSWK, Local0)
                            If (Arg0)
                            {
                                Or (Local0, Arg1, HSWK) /* \_SB_.PCI0.LPCB.EC0_.HSWK */
                            }
                            Else
                            {
                                And (Local0, Not (Arg1), HSWK) /* \_SB_.PCI0.LPCB.EC0_.HSWK */
                            }
                        }
                        Else
                        {
                            Store (0x00, HSWK) /* \_SB_.PCI0.LPCB.EC0_.HSWK */
                        }
                    }

                    Method (UHSW, 0, Serialized)
                    {
                    }

                    Method (CHSW, 1, Serialized)
                    {
                        Store (0x00, Local1)
                        Return (Local1)
                    }

                    Method (SHSW, 2, Serialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            If (Arg1)
                            {
                                Or (HSEN, Arg0, HSEN) /* \_SB_.PCI0.LPCB.EC0_.HSEN */
                            }
                            Else
                            {
                                And (HSEN, Not (Arg0), HSEN) /* \_SB_.PCI0.LPCB.EC0_.HSEN */
                            }
                        }

                        Release (ECMX)
                    }

                    Method (HWLP, 1, NotSerialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            XOr (Arg0, 0x00, WLP) /* \_SB_.PCI0.LPCB.EC0_.WLP_ */
                        }

                        Release (ECMX)
                    }

                    Method (HWWP, 1, Serialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            If (LAnd (And (WWIX, 0x80), LEqual (Arg0, 0x00)))
                            {
                                Sleep (0x1388)
                            }

                            XOr (And (Arg0, 0x01), 0x01, WWP) /* \_SB_.PCI0.LPCB.EC0_.WWP_ */
                        }

                        Release (ECMX)
                    }

                    Method (ECAB, 4, Serialized)
                    {
                        Store (0xECAB, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (0xFF00, Local0)
                            Store (Arg0, ABDI) /* \_SB_.PCI0.LPCB.EC0_.ABDI */
                            Store (Arg1, ABAD) /* \_SB_.PCI0.LPCB.EC0_.ABAD */
                            Store (Arg2, ABIX) /* \_SB_.PCI0.LPCB.EC0_.ABIX */
                            If (LEqual (And (Arg1, 0x01), 0x00))
                            {
                                Store (Arg3, ABDA) /* \_SB_.PCI0.LPCB.EC0_.ABDA */
                            }

                            Store (0xFF, ABST) /* \_SB_.PCI0.LPCB.EC0_.ABST */
                            Sleep (0x5A)
                            Store (0x80, Local0)
                            Store (0x0B, Local1)
                            While (LAnd (And (Local0, 0x80), LGreater (Local1, 0x00)))
                            {
                                Sleep (0x0A)
                                Store (ABST, Local0)
                                Decrement (Local1)
                            }

                            ShiftLeft (Local0, 0x08, Local0)
                            If (LAnd (LEqual (Local0, 0x00), And (Arg1, 0x01)))
                            {
                                And (ABDA, 0xFF, Local1)
                                Or (Local0, Local1, Local0)
                            }
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Name (NGBF, 0xFF)
                    Name (NGBT, 0xFF)
                    Name (GACP, 0x07)
                    Name (ACST, 0x01)
                    Name (SMAR, 0x00)
                    Name (NBAP, 0x00)
                    Name (NNBO, 0x01)
                    Name (NDCB, 0x00)
                    Name (NLB1, 0xC8)
                    Name (NLB2, 0x64)
                    Mutex (BTMX, 0x00)
                    Method (UPAD, 0, Serialized)
                    {
                        Acquire (BTMX, 0xFFFF)
                        If (And (GACP, 0x01))
                        {
                            And (GACP, 0x06, GACP) /* \_SB_.PCI0.LPCB.EC0_.GACP */
                            Release (BTMX)
                            Store (0x01, Local0)
                            Store (0x00, Local1)
                            Acquire (ECMX, 0xFFFF)
                            If (ECRG)
                            {
                                Store (ADP, Local0)
                                Store (ADID, Local1)
                            }

                            Release (ECMX)
                            Store (Local0, ACST) /* \_SB_.PCI0.LPCB.EC0_.ACST */
                            If (And (DTCD, 0x0800))
                            {
                                If (And (DTCD, 0x1000))
                                {
                                    Store (0x00, ACST) /* \_SB_.PCI0.LPCB.EC0_.ACST */
                                }
                                Else
                                {
                                    Store (0x01, ACST) /* \_SB_.PCI0.LPCB.EC0_.ACST */
                                }
                            }

                            Store (Local1, SMAR) /* \_SB_.PCI0.LPCB.EC0_.SMAR */
                        }
                        Else
                        {
                            Release (BTMX)
                        }
                    }

                    Method (GACS, 0, Serialized)
                    {
                        UPAD ()
                        Return (ACST) /* \_SB_.PCI0.LPCB.EC0_.ACST */
                    }

                    Method (GPID, 0, Serialized)
                    {
                        UPAD ()
                        Return (SMAR) /* \_SB_.PCI0.LPCB.EC0_.SMAR */
                    }

                    Method (GBAP, 0, Serialized)
                    {
                        Acquire (BTMX, 0xFFFF)
                        If (And (GACP, 0x02))
                        {
                            And (GACP, 0x05, GACP) /* \_SB_.PCI0.LPCB.EC0_.GACP */
                            Release (BTMX)
                            Acquire (ECMX, 0xFFFF)
                            If (ECRG)
                            {
                                Store (BATP, NBAP) /* \_SB_.PCI0.LPCB.EC0_.NBAP */
                            }

                            Release (ECMX)
                        }
                        Else
                        {
                            Release (BTMX)
                        }

                        Return (NBAP) /* \_SB_.PCI0.LPCB.EC0_.NBAP */
                    }

                    Method (PWUP, 2, Serialized)
                    {
                        Store (0x00, Local0)
                        Acquire (BTMX, 0xFFFF)
                        Or (Arg0, GACP, Local1)
                        And (Local1, 0x07, GACP) /* \_SB_.PCI0.LPCB.EC0_.GACP */
                        If (And (GACP, 0x02))
                        {
                            Or (NGBF, Arg1, NGBF) /* \_SB_.PCI0.LPCB.EC0_.NGBF */
                        }

                        If (And (GACP, 0x04))
                        {
                            If (LNotEqual (NGBT, 0xFF))
                            {
                                Store (0x01, Local0)
                            }

                            Or (NGBT, Arg1, NGBT) /* \_SB_.PCI0.LPCB.EC0_.NGBT */
                        }

                        Release (BTMX)
                        Return (Local0)
                    }

                    Method (BTDR, 1, Serialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (0x01, NNBO) /* \_SB_.PCI0.LPCB.EC0_.NNBO */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x00))
                            {
                                Store (0x00, NNBO) /* \_SB_.PCI0.LPCB.EC0_.NNBO */
                            }
                        }

                        Return (NNBO) /* \_SB_.PCI0.LPCB.EC0_.NNBO */
                    }

                    Method (BSTA, 1, Serialized)
                    {
                        BTDR (0x01)
                        Store (GBAP (), Local0)
                        Store (0x0F, Local1)
                        If (And (Local0, Arg0))
                        {
                            Store (0x1F, Local1)
                        }

                        Return (Local1)
                    }

                    Method (GBSS, 2, Serialized)
                    {
                        ToBCD (Arg0, Local0)
                        Store (\ISTR (Local0, 0x05), Local3)
                        Concatenate (Local3, " ", Local4)
                        ShiftRight (Arg1, 0x09, Local0)
                        Add (Local0, 0x07BC, Local1)
                        ToBCD (Local1, Local0)
                        Store (\ISTR (Local0, 0x04), Local2)
                        Concatenate (Local4, Local2, Local3)
                        Concatenate (Local3, "/", Local4)
                        ShiftRight (Arg1, 0x05, Local0)
                        And (Local0, 0x0F, Local1)
                        ToBCD (Local1, Local0)
                        Store (\ISTR (Local0, 0x02), Local2)
                        Concatenate (Local4, Local2, Local3)
                        Concatenate (Local3, "/", Local4)
                        And (Arg1, 0x1F, Local1)
                        ToBCD (Local1, Local0)
                        Store (\ISTR (Local0, 0x02), Local2)
                        Concatenate (Local4, Local2, Local3)
                        Return (Local3)
                    }

                    Method (GBMF, 0, Serialized)
                    {
                        Store (Buffer (0x12) {}, Local0)
                        Store (0x00, Local3)
                        Store (BMF, Local1)
                        While (LAnd (LLess (Local3, 0x10), LNotEqual (Local1, 0x00)))
                        {
                            Store (Local1, Index (Local0, Local3))
                            Increment (Local3)
                            Store (BMF, Local1)
                        }

                        Return (Local0)
                    }

                    Method (GCTL, 1, Serialized)
                    {
                        Name (CTBF, Buffer (0x10) {})
                        Store (0x00, Local3)
                        Store (0x00, Local2)
                        While (LNotEqual (Local3, 0x10))
                        {
                            Store (CTLB, Index (CTBF, Local2))
                            Increment (Local2)
                            Increment (Local3)
                        }

                        Return (CTBF) /* \_SB_.PCI0.LPCB.EC0_.GCTL.CTBF */
                    }

                    Method (GDNM, 1, Serialized)
                    {
                        Name (DNBF, Buffer (0x07) {})
                        Store (0x00, Local3)
                        Store (0x00, Local2)
                        While (LNotEqual (Local3, 0x07))
                        {
                            Store (BDN, Index (DNBF, Local2))
                            Increment (Local2)
                            Increment (Local3)
                        }

                        Return (DNBF) /* \_SB_.PCI0.LPCB.EC0_.GDNM.DNBF */
                    }

                    Method (GDCH, 1, Serialized)
                    {
                        Name (DCBF, Buffer (0x04) {})
                        Store (0x00, Local3)
                        Store (0x00, Local2)
                        While (LNotEqual (Local3, 0x04))
                        {
                            Store (BTY, Index (DCBF, Local2))
                            Increment (Local2)
                            Increment (Local3)
                        }

                        Return (DCBF) /* \_SB_.PCI0.LPCB.EC0_.GDCH.DCBF */
                    }

                    Method (BTIF, 1, Serialized)
                    {
                        ShiftLeft (0x01, Arg0, Local7)
                        BTDR (0x01)
                        If (LEqual (BSTA (Local7), 0x0F))
                        {
                            Return (0xFF)
                        }

                        Acquire (BTMX, 0xFFFF)
                        Store (NGBF, Local0)
                        Release (BTMX)
                        If (LEqual (And (Local0, Local7), 0x00))
                        {
                            Return (0x00)
                        }

                        Store (NDBS, Index (NBST, Arg0))
                        Acquire (BTMX, 0xFFFF)
                        Or (NGBT, Local7, NGBT) /* \_SB_.PCI0.LPCB.EC0_.NGBT */
                        Release (BTMX)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                            Store (B1B2 (BFC0, BFC1), Local0)
                            Store (Local0, Index (DerefOf (Index (NBTI, Arg0)), 0x01))
                            Store (Local0, Index (DerefOf (Index (NBTI, Arg0)), 0x02))
                            Store (B1B2 (BDV0, BDV1), Index (DerefOf (Index (NBTI, Arg0)), 0x04))
                            Store (NLB1, Index (DerefOf (Index (NBTI, Arg0)), 0x05))
                            Store (NLB2, Index (DerefOf (Index (NBTI, Arg0)), 0x06))
                            Store (B1B2 (BSN0, BSN1), Local0)
                            	Store (B1B2 (BDA0, BDA1), Local1)
	// battery cycle count
	Store (B1B2 (BCC0, BCC1), Index (DerefOf (Index (NBTI, Arg0)), 0x0D))
	// battery temperature
    Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
    Store (5, \_SB.PCI0.LPCB.EC0.CRZN)
    Store (\_SB.PCI0.LPCB.EC0.TEMP, Local2)
    Release (\_SB.PCI0.LPCB.EC0.ECMX)
	Add (Multiply (Local2, 10), 2732, Local2) // Celsius to .1K
	Store (Local2, Index (DerefOf (Index (NBTI, Arg0)), 0x0E))

                        }

                        Release (ECMX)
                        Store (GBSS (Local0, Local1), Local2)
                        Store (Local2, Index (DerefOf (Index (NBTI, Arg0)), 0x0A))
                        Acquire (BTMX, 0xFFFF)
                        And (NGBF, Not (Local7), NGBF) /* \_SB_.PCI0.LPCB.EC0_.NGBF */
                        Release (BTMX)
                        Return (0x00)
                    }

                    Method (BTST, 2, Serialized)
                    {
                        ShiftLeft (0x01, Arg0, Local7)
                        BTDR (0x01)
                        If (LEqual (BSTA (Local7), 0x0F))
                        {
                            Store (Package (0x04)
                                {
                                    0x00, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF
                                }, Index (NBST, Arg0))
                            Return (0xFF)
                        }

                        Acquire (BTMX, 0xFFFF)
                        If (Arg1)
                        {
                            Store (0xFF, NGBT) /* \_SB_.PCI0.LPCB.EC0_.NGBT */
                        }

                        Store (NGBT, Local0)
                        Release (BTMX)
                        If (LEqual (And (Local0, Local7), 0x00))
                        {
                            Return (0x00)
                        }

                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                            Store (BST, Local0)
                            Store (B1B2 (BPR0, BPR1), Local3)
                            Store (B1B2 (BRC0, BRC1), Index (DerefOf (Index (NBST, Arg0)), 0x02))
                            Store (B1B2 (BPV0, BPV1), Index (DerefOf (Index (NBST, Arg0)), 0x03))
                        }

                        Release (ECMX)
                        If (LEqual (GACS (), 0x01))
                        {
                            And (Not (0x01), Local0, Local0)
                        }
                        Else
                        {
                            And (Not (0x02), Local0, Local0)
                        }

                        If (And (Local0, 0x01))
                        {
                            Acquire (BTMX, 0xFFFF)
                            Store (Local7, NDCB) /* \_SB_.PCI0.LPCB.EC0_.NDCB */
                            Release (BTMX)
                        }

                        Store (Local0, Index (DerefOf (Index (NBST, Arg0)), 0x00))
                        If (And (Local0, 0x01))
                        {
                            If (LOr (LLess (Local3, 0x0190), LGreater (Local3, 0x1964)))
                            {
                                Store (DerefOf (Index (DerefOf (Index (NBST, Arg0)), 0x01)), 
                                    Local5)
                                If (LOr (LLess (Local5, 0x0190), LGreater (Local5, 0x1964)))
                                {
                                    Store (Divide (0x1AF4, 0x02, ), Local3)
                                }
                                Else
                                {
                                    Store (Local5, Local3)
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (And (Local0, 0x02), 0x00))
                            {
                                Store (0x00, Local3)
                            }
                        }

                        Store (Local3, Index (DerefOf (Index (NBST, Arg0)), 0x01))
                        Acquire (BTMX, 0xFFFF)
                        And (NGBT, Not (Local7), NGBT) /* \_SB_.PCI0.LPCB.EC0_.NGBT */
                        Release (BTMX)
                        Return (0x00)
                    }

                    Method (ITLB, 0, NotSerialized)
                    {
                        Divide (Add (NLB1, 0x09), 0x0A, Local0, Local1)
                        Divide (Add (0x96, 0x09), 0x0A, Local0, Local2)
                        If (ECRG)
                        {
                            Store (Local1, LB1) /* \_SB_.PCI0.LPCB.EC0_.LB1_ */
                            Store (Local2, LB2) /* \_SB_.PCI0.LPCB.EC0_.LB2_ */
                        }
                    }

                    Method (GBTI, 1, NotSerialized)
                    {
                        Store ("Enter getbattinfo", Debug)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            If (And (BATP, ShiftLeft (0x01, Arg0)))
                            {
                                Store (Arg0, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                                Store (Package (0x03)
                                    {
                                        0x00, 
                                        0x6B, 
                                        Buffer (0x6B) {}
                                    }, Local0)
                                Store (B1B2 (BDC0, BDC1), Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                Store (ShiftRight (B1B2 (BDC0, BDC1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x01))
                                Store (B1B2 (BFC0, BFC1), Index (DerefOf (Index (Local0, 0x02)), 0x02))
                                Store (ShiftRight (B1B2 (BFC0, BFC1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x03))
                                Store (B1B2 (BRC0, BRC1), Index (DerefOf (Index (Local0, 0x02)), 0x04))
                                Store (ShiftRight (B1B2 (BRC0, BRC1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x05))
                                Store (B1B2 (BME0, BME1), Index (DerefOf (Index (Local0, 0x02)), 0x06))
                                Store (ShiftRight (B1B2 (BME0, BME1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x07))
                                Store (B1B2 (BCC0, BCC1), Index (DerefOf (Index (Local0, 0x02)), 0x08))
                                Store (ShiftRight (B1B2 (BCC0, BCC1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x09))
                                Store (B1B2 (CBT0, CBT1), Local1)
                                Subtract (Local1, 0x0AAC, Local1)
                                Divide (Local1, 0x0A, Local2, Local3)
                                Store (Local3, Index (DerefOf (Index (Local0, 0x02)), 0x0A))
                                Store (ShiftRight (Local3, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x0B))
                                Store (B1B2 (BPV0, BPV1), Index (DerefOf (Index (Local0, 0x02)), 0x0C))
                                Store (ShiftRight (B1B2 (BPV0, BPV1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x0D))
                                Store (B1B2 (BPR0, BPR1), Local1)
                                If (Local1)
                                {
                                    If (And (B1B2 (BST0, BST1), 0x40))
                                    {
                                        Add (Not (Local1), 0x01, Local1)
                                        And (Local1, 0xFFFF, Local1)
                                    }
                                }

                                Store (Local1, Index (DerefOf (Index (Local0, 0x02)), 0x0E))
                                Store (ShiftRight (Local1, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x0F))
                                Store (B1B2 (BDV0, BDV1), Index (DerefOf (Index (Local0, 0x02)), 0x10))
                                Store (ShiftRight (B1B2 (BDV0, BDV1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x11))
                                Store (B1B2 (BST0, BST1), Index (DerefOf (Index (Local0, 0x02)), 0x12))
                                Store (ShiftRight (B1B2 (BST0, BST1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x13))
                                Store (B1B2 (BCX0, BCX1), Index (DerefOf (Index (Local0, 0x02)), 0x14))
                                Store (ShiftRight (B1B2 (BCX0, BCX1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x15))
                                Store (B1B2 (BCA0, BCA1), Index (DerefOf (Index (Local0, 0x02)), 0x16))
                                Store (ShiftRight (B1B2 (BCA0, BCA1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x17))
                                Store (B1B2 (BCB0, BCB1), Index (DerefOf (Index (Local0, 0x02)), 0x18))
                                Store (ShiftRight (B1B2 (BCB0, BCB1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x19))
                                Store (B1B2 (BCP0, BCP1), Index (DerefOf (Index (Local0, 0x02)), 0x1A))
                                Store (ShiftRight (B1B2 (BCP0, BCP1), 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x1B))
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (0x1C, 0x08), 
                                    Multiply (0x10, 0x08), BTSN)
                                Store (GBSS (B1B2 (BSN0, BSN1), B1B2 (BDA0, BDA1)), BTSN)
 /* \_SB_.PCI0.LPCB.EC0_.GBTI.BTSN */
                                Store (GBMF (), Local1)
                                Store (SizeOf (Local1), Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (0x2C, 0x08), 
                                    Multiply (Local2, 0x08), BMAN)
                                Store (Local1, BMAN) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BMAN */
                                Add (Local2, 0x2C, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x10, 0x08), CLBL)
                                Store (GCTL (0x00), CLBL) /* \_SB_.PCI0.LPCB.EC0_.GBTI.CLBL */
                                Add (Local2, 0x11, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x07, 0x08), DNAM)
                                Store (GDNM (0x00), DNAM) /* \_SB_.PCI0.LPCB.EC0_.GBTI.DNAM */
                                Add (Local2, 0x07, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x04, 0x08), DCHE)
                                Store (GDCH (0x00), DCHE) /* \_SB_.PCI0.LPCB.EC0_.GBTI.DCHE */
                                Add (Local2, 0x04, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BMAC)
                                Store (0x00, BMAC) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BMAC */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BMAD)
                                Store (B1B2 (BDA0, BDA1), BMAD) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BMAD */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BCCU)
                                Store (BRCC, BCCU) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BCCU */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BCVO)
                                Store (BRCV, BCVO) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BCVO */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BAVC)
                                Store (B1B2 (BCR0, BCR1), Local1)
                                If (Local1)
                                {
                                    If (And (B1B2 (BST0, BST1), 0x40))
                                    {
                                        Add (Not (Local1), 0x01, Local1)
                                        And (Local1, 0xFFFF, Local1)
                                    }
                                }

                                Store (Local1, BAVC) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BAVC */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), RTTE)
                                Store (B1B2 (RTE0, RTE1), RTTE) /* \_SB_.PCI0.LPCB.EC0_.GBTI.RTTE */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), ATTE)
                                Store (B1B2 (ATE0, ATE1), RTTE) /* \_SB_.PCI0.LPCB.EC0_.GBTI.RTTE */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), ATTF)
                                Store (B1B2 (ATF0, ATF1), RTTE) /* \_SB_.PCI0.LPCB.EC0_.GBTI.RTTE */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x01, 0x08), NOBS)
                                Store (BATN, NOBS) /* \_SB_.PCI0.LPCB.EC0_.GBTI.NOBS */
                            }
                            Else
                            {
                                Store (Package (0x02)
                                    {
                                        0x34, 
                                        0x00
                                    }, Local0)
                            }
                        }
                        Else
                        {
                            Store (Package (0x02)
                                {
                                    0x0D, 
                                    0x00
                                }, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (GBTC, 0, NotSerialized)
                    {
                        Store ("Enter GetBatteryControl", Debug)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Package (0x03)
                                {
                                    0x00, 
                                    0x04, 
                                    Buffer (0x04) {}
                                }, Local0)
                            If (And (BATP, 0x01))
                            {
                                Store (0x00, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                                Store (0x00, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                If (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x00)), LEqual (
                                    IDIS, 0x00)))
                                {
                                    Store (0x00, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                }
                                Else
                                {
                                    If (LAnd (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x02)), 
                                        LEqual (IDIS, 0x01)), LEqual (B1B2 (AXC0, AXC1), 0x00)))
                                    {
                                        Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                    }
                                    Else
                                    {
                                        If (LAnd (LEqual (INAC, 0x01), LEqual (IDIS, 0x02)))
                                        {
                                            Store (0x02, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                        }
                                        Else
                                        {
                                            If (LAnd (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x02)), 
                                                LEqual (IDIS, 0x01)), LEqual (B1B2 (AXC0, AXC1), 0xFA)))
                                            {
                                                Store (0x03, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                            }
                                            Else
                                            {
                                                If (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x03)))
                                                {
                                                    Store (0x04, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0xFF, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                            }

                            If (And (BATP, 0x02))
                            {
                                Store (0x01, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                                Store (0x00, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                If (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x00)), LEqual (
                                    IDIS, 0x00)))
                                {
                                    Store (0x00, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                }
                                Else
                                {
                                    If (LAnd (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x01)), 
                                        LEqual (IDIS, 0x02)), LEqual (B1B2 (AXC0, AXC1), 0x00)))
                                    {
                                        Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                    }
                                    Else
                                    {
                                        If (LAnd (LEqual (INAC, 0x01), LEqual (IDIS, 0x01)))
                                        {
                                            Store (0x02, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                        }
                                        Else
                                        {
                                            If (LAnd (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x01)), 
                                                LEqual (IDIS, 0x02)), LEqual (B1B2 (AXC0, AXC1), 0xFA)))
                                            {
                                                Store (0x03, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                            }
                                            Else
                                            {
                                                If (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x03)))
                                                {
                                                    Store (0x04, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0xFF, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                            }
                        }
                        Else
                        {
                            Store (Package (0x02)
                                {
                                    0x35, 
                                    0x00
                                }, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (SBTC, 3, NotSerialized)
                    {
                        Store ("Enter SetBatteryControl", Debug)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg2, Local0)
                            Store (Local0, Debug)
                            Store (Package (0x02)
                                {
                                    0x06, 
                                    0x00
                                }, Local4)
                            Store (0x00, Local1)
                            Store (0x00, Local2)
                            Store (DerefOf (Index (Local0, 0x10)), Local1)
                            If (LEqual (Local1, 0x00))
                            {
                                Store ("battery 0", Debug)
                                If (And (BATP, 0x01))
                                {
                                    Store (DerefOf (Index (Local0, 0x11)), Local2)
                                    If (LEqual (Local2, 0x00))
                                    {
                                        Store (0x00, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x00, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x00, AXC0)
Store (0x00, AXC1) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x01, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x01))
                                    {
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x02, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x01, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, AXC0)
Store (0x00, AXC1) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x02))
                                    {
                                        Store (0x01, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x01, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x02, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x03))
                                    {
                                        Store (0x02, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x01, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0xFA, AXC0)
Store (Zero, AXC1) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x04))
                                    {
                                        Store (0xFA, AXC0)
Store (Zero, AXC1) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x05))
                                    {
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x03, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }
                                }
                                Else
                                {
                                    Store (Package (0x02)
                                        {
                                            0x34, 
                                            0x00
                                        }, Local4)
                                }
                            }

                            If (LEqual (Local1, 0x01))
                            {
                                If (And (BATP, 0x02))
                                {
                                    Store ("battery 1", Debug)
                                    Store (DerefOf (Index (Local0, 0x11)), Local2)
                                    If (LEqual (Local2, 0x00))
                                    {
                                        Store (0x00, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x00, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x00, AXC0)
Store (0x00, AXC1) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x01, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x01))
                                    {
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x01, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x02, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, AXC0)
Store (0x00, AXC1) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x02))
                                    {
                                        Store (0x01, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x02, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x01, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x03))
                                    {
                                        Store (0x01, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x02, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0xFA, AXC0)
Store (Zero, AXC1) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x04))
                                    {
                                        Store (0x00, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x00, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x05))
                                    {
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x03, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }
                                }
                                Else
                                {
                                    Store (Package (0x02)
                                        {
                                            0x34, 
                                            0x00
                                        }, Local4)
                                }
                            }
                        }

                        Release (ECMX)
                        Return (Local4)
                    }

                    Mutex (OTMT, 0x00)
                    Name (OTLL, 0x01)
                    Name (OTSI, 0x01)
                    Name (OTRT, 0x00)
                    Name (OTEN, 0x00)
                    Name (LRPC, 0x00)
                    Name (MXCP, 0x00)
                    Name (DCCP, 0x00)
                    Method (_Q03, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (BTMX, 0xFFFF)
                        Store (NDCB, Local0)
                        Release (BTMX)
                        PWUP (0x04, Local0)
                        SBTN (Local0, 0x80)
                    }

                    Method (_Q04, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (OTMT, 0xFFFF)
                        Store (GTST (), OTLL) /* \_SB_.PCI0.LPCB.EC0_.OTLL */
                        Store (0x01, OTSI) /* \_SB_.PCI0.LPCB.EC0_.OTSI */
                        Release (OTMT)
                        If (LNotEqual (RPPC (0x00), 0x00))
                        {
                            PPNT ()
                        }
                    }

                    Method (_Q05, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (THEM, Local0)
                        
                    }

                    Method (_Q06, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x05, Or (0x02, 0x01))
                        If (BTDR (0x02))
                        {
                            Notify (\_SB.ADP1, 0x80) // Status Change
                        }

                        \_GPE.VBRE (0x00)
                        If (\_SB.PCI0.RP03.PDSX)
                        {
                            If (LEqual (\_SB.PCI0.LPCB.EC0.ADP, One))
                            {
                                Store (0x00, \_SB.PCI0.RP03.SMHC.D3EF)
                            }
                            Else
                            {
                                Store (0x01, \_SB.PCI0.RP03.SMHC.D3EF)
                            }
                        }
                        Else
                        {
                            If (LEqual (\_SB.PCI0.LPCB.EC0.ADP, One))
                            {
                                Store (0x00, GI69) /* \GI69 */
                                Store (0x00, GL69) /* \GL69 */
                                Sleep (0x05)
                                Store (0x01, GL69) /* \GL69 */
                                Store (0x01, GI69) /* \GI69 */
                            }
                        }
                    }

                    Method (_Q08, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x06, 0x01)
                        Store (GBAP (), Local0)
                        If (LNotEqual (Local0, 0x02))
                        {
                            PWUP (0x04, 0x02)
                            If (BTDR (0x02))
                            {
                                Notify (\_SB.BAT1, 0x80) // Status Change
                            }
                        }

                        If (BTDR (0x02))
                        {
                            Notify (\_SB.BAT0, 0x81) // Information Change
                        }
                    }

                    Method (_Q0A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (\_GPE.VLET (), Local4)
                        Notify (\_SB.LID, 0x80) // Status Change
                        \_SB.PCI0.ACEL.AJAL ()

                    }

                    Method (_Q09, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x04, 0x01)
                        If (BTDR (0x02))
                        {
                            Notify (\_SB.BAT0, 0x80) // Status Change
                        }
                    }

                    Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        
                    }

                    Method (_Q0C, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (THEM, Local0)
                        
                    }

                    Method (_Q18, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x06, 0x02)
                        Store (GBAP (), Local0)
                        If (LNotEqual (Local0, 0x01))
                        {
                            PWUP (0x04, 0x01)
                            If (BTDR (0x02))
                            {
                                Notify (\_SB.BAT0, 0x80) // Status Change
                            }
                        }

                        If (BTDR (0x02))
                        {
                            Notify (\_SB.BAT1, 0x81) // Information Change
                        }
                    }

                    Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x04, 0x02)
                        If (BTDR (0x02))
                        {
                            Notify (\_SB.BAT1, 0x80) // Status Change
                        }
                    }

                    Method (_Q20, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (And (PSSA, 0x01), Local0)
                            Store (And (PSSB, 0x01), Local1)
                            Store (And (PSSA, 0x02), Local2)
                            Store (And (PSSB, 0x02), Local3)
                            Store (And (PSSA, 0x10), Local4)
                            Store (And (PSSB, 0x10), Local5)
                            If (LAnd (LNotEqual (Local0, Local1), LEqual (Local0, 0x00)))
                            {

                                Store (PSSB, PSSA) /* \PSSA */
                            }
                            Else
                            {
                                If (LAnd (LNotEqual (Local4, Local5), LEqual (Local4, 0x00)))
                                {

                                    Store (PSSB, PSSA) /* \PSSA */
                                }
                                Else
                                {
                                    If (LAnd (LNotEqual (Local0, Local1), LEqual (Local0, 0x01)))
                                    {

                                        Store (PSSB, PSSA) /* \PSSA */
                                    }
                                    Else
                                    {
                                        If (LAnd (LNotEqual (Local2, Local3), LEqual (Local2, 0x02)))
                                        {
                                            If (LNot (BCIE))
                                            {

                                            }

                                            Store (0x00, BCIE) /* \BCIE */
                                            Store (PSSB, PSSA) /* \PSSA */
                                        }
                                        Else
                                        {
                                            If (LAnd (LNotEqual (Local2, Local3), LEqual (Local2, 0x00)))
                                            {
                                                If (LNot (BCIE))
                                                {

                                                }

                                                Store (0x00, BCIE) /* \BCIE */
                                                Store (PSSB, PSSA) /* \PSSA */
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Release (ECMX)
                    }

                    Method (_Q22, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x01, \_SB.PCI0.LPCB.EC0.TBOS)
                        \_SB.PCI0.LPCB.EC0.SMCP (0x01)
                    }

                    Method (_Q23, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x00, \_SB.PCI0.LPCB.EC0.TBOS)
                        \_SB.PCI0.LPCB.EC0.SMCP (0x00)
                    }

                    Method (SBTN, 2, Serialized)
                    {
                        If (And (Arg0, 0x01))
                        {
                            Notify (\_SB.BAT0, Arg1)
                        }

                        If (And (Arg0, 0x02))
                        {
                            Notify (\_SB.BAT1, Arg1)
                        }
                    }

                    Method (PRIT, 0, NotSerialized)
                    {
                        Store (GACS (), Local0)
                        Store (Local0, PWRS) /* \PWRS */
                        \_SB.PCI0.LPCB.EC0.SMCP (Local0)
                        If (LEqual (\_SB.PCI0.HDEF.ASTI, 0x00))
                        {
                            SAST (\_SB.PCI0.HDEF.ASTA)
                        }

                        Store (\_SB.HST1.GHID (), Local0)
                        If (And (GBAP (), 0x01))
                        {
                            Store (0x1F, BT0P) /* \_SB_.BT0P */
                        }

                        
                    }

                    Method (GTST, 0, Serialized)
                    {
                        Store (0x02, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (OCPS, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (ETSI, 3, Serialized)
                    {
                        If (LNotEqual (Arg2, 0x00))
                        {
                            Store (0x00, OTRT) /* \_SB_.PCI0.LPCB.EC0_.OTRT */
                        }

                        If (LOr (LNotEqual (Arg1, OTRT), LNotEqual (Arg0, OTEN)))
                        {
                            Acquire (ECMX, 0xFFFF)
                            If (ECRG)
                            {
                                If (LNotEqual (Arg1, OTRT))
                                {
                                    Store (Arg1, OCPR) /* \_SB_.PCI0.LPCB.EC0_.OCPR */
                                    Store (Arg1, OTRT) /* \_SB_.PCI0.LPCB.EC0_.OTRT */
                                }

                                Store (Arg0, OCPE) /* \_SB_.PCI0.LPCB.EC0_.OCPE */
                                Store (Arg0, OTEN) /* \_SB_.PCI0.LPCB.EC0_.OTEN */
                            }

                            Release (ECMX)
                        }
                    }

                    Method (SMCP, 1, Serialized)
                    {
                        Store (0x00, Local0)
                        Store (DCCP, Local1)
                        If (LEqual (Local1, 0x00))
                        {
                            Store (0x01, Local1)
                            If (CondRefOf (\_PR.CPPC, Local7))
                            {
                                If (LGreater (\_PR.CPPC, 0x00))
                                {
                                    Store (\_PR.CPPC, Local1)
                                }
                            }
                        }

                        Acquire (OTMT, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            If (LAnd (TBOD, \_SB.PCI0.LPCB.EC0.TBOS))
                            {
                                Store (Local0, MXCP) /* \_SB_.PCI0.LPCB.EC0_.MXCP */
                                Store (Local1, Local2)
                            }
                            Else
                            {
                                Store (Local1, MXCP) /* \_SB_.PCI0.LPCB.EC0_.MXCP */
                                Store (Local0, Local2)
                            }
                        }
                        Else
                        {
                            Store (Local0, MXCP) /* \_SB_.PCI0.LPCB.EC0_.MXCP */
                            Store (Local1, Local2)
                        }

                        If (LEqual (LRPC, Local2))
                        {
                            Store (MXCP, LRPC) /* \_SB_.PCI0.LPCB.EC0_.LRPC */
                        }

                        Release (OTMT)
                        RPPC (0x01)
                        If (LEqual (DCCP, 0x00))
                        {
                            Store (Local1, DCCP) /* \_SB_.PCI0.LPCB.EC0_.DCCP */
                            If (CondRefOf (\_PR.CPU0._PPC, Local5))
                            {
                                If (LNotEqual (\_PR.CPPC, \_PR.CPU0._PPC))
                                {
                                    Store (\_PR.CPU0._PPC, \_PR.CPPC) /* External reference */
                                }
                            }
                        }

                        PNOT ()
                    }

                    Method (RPPC, 1, Serialized)
                    {
                        Store (0x00, Local1)
                        If (CondRefOf (\_PR.CPU0._PSS, Local2))
                        {
                            Store (\_PR.CPU0._PSS, Local0)
                            Store (SizeOf (Local0), Local1)
                        }

                        Store (0x00, Local3)
                        If (LGreater (Local1, 0x00))
                        {
                            Subtract (Local1, 0x01, Local1)
                        }
                        Else
                        {
                            Store (0x03, Local3)
                        }

                        Acquire (OTMT, 0xFFFF)
                        If (OTSI)
                        {
                            Store (OTLL, Local0)
                            Store (0x00, OTSI) /* \_SB_.PCI0.LPCB.EC0_.OTSI */
                            If (LEqual (Local0, 0x00))
                            {
                                If (LLess (LRPC, Local1))
                                {
                                    Add (LRPC, 0x01, LRPC) /* \_SB_.PCI0.LPCB.EC0_.LRPC */
                                }
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x02))
                                {
                                    If (LGreater (LRPC, MXCP))
                                    {
                                        Subtract (LRPC, 0x01, LRPC) /* \_SB_.PCI0.LPCB.EC0_.LRPC */
                                    }
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x03))
                                    {
                                        Store (Local1, LRPC) /* \_SB_.PCI0.LPCB.EC0_.LRPC */
                                    }
                                }
                            }
                        }

                        If (LLess (LRPC, Local1))
                        {
                            Or (Local3, 0x01, Local3)
                        }

                        If (LGreater (LRPC, MXCP))
                        {
                            Or (Local3, 0x02, Local3)
                        }

                        ETSI (Local3, 0x14, Arg0)
                        Store (0x00, Local4)
                        If (CondRefOf (\_PR.CPU0._PPC, Local5))
                        {
                            If (LNotEqual (LRPC, \_PR.CPU0._PPC))
                            {
                                Store (LRPC, \_PR.CPU0._PPC) /* External reference */
                                Store (0x01, Local4)
                            }
                        }

                        Release (OTMT)
                        Return (Local4)
                    }

                    Method (PPNT, 0, Serialized)
                    {
                        
                        // nothing

                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Device (HTAM)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x05)  // _UID: Unique ID
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Return (ResourceTemplate ()
                        {
                            IO (Decode16,
                                0xFE00,             // Range Minimum
                                0xFE00,             // Range Maximum
                                0x01,               // Alignment
                                0x10,               // Length
                                )
                            IO (Decode16,
                                0xFE80,             // Range Minimum
                                0xFE80,             // Range Maximum
                                0x01,               // Alignment
                                0x10,               // Length
                                )
                            Memory32Fixed (ReadWrite,
                                0xFED40000,         // Address Base
                                0x00005000,         // Address Length
                                )
                        })
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (TPMX, 0x00))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (GTPM)
                {
                    Method (_HID, 0, Serialized)  // _HID: Hardware ID
                    {
                        If (LEqual (TVID, 0x15D1))
                        {
                            Return (0x0201D824)
                        }
                        Else
                        {
                            Return (0x310CD041)
                        }
                    }

                    Name (_CID, EisaId ("PNP0C31"))  // _CID: Compatible ID
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Return (ResourceTemplate ()
                        {
                            IO (Decode16,
                                0xFE00,             // Range Minimum
                                0xFE00,             // Range Maximum
                                0x01,               // Alignment
                                0x10,               // Length
                                )
                            IO (Decode16,
                                0xFE80,             // Range Minimum
                                0xFE80,             // Range Maximum
                                0x01,               // Alignment
                                0x10,               // Length
                                )
                            Memory32Fixed (ReadWrite,
                                0xFED40000,         // Address Base
                                0x00005000,         // Address Length
                                )
                        })
                    }

                    OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x1000)
                    Field (TMMB, ByteAcc, Lock, Preserve)
                    {
                        ACCS,   8, 
                        Offset (0x18), 
                        TSTA,   8, 
                        TBCA,   8, 
                        Offset (0xF00), 
                        TVID,   16, 
                        TDID,   16
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (ACCS, 0xFF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (LEqual (TPMX, 0x01))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }
                    }

                    Name (PUID, Buffer (0x10)
                    {
                        /* 0000 */   0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E,
                        /* 0008 */   0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                    })
                    Name (REV1, "1.2")
                    Name (PPIB, Buffer (0x02)
                    {
                         0x00, 0x00
                    })
                    Name (MUID, Buffer (0x10)
                    {
                        /* 0000 */   0xED, 0x54, 0x60, 0x37, 0x13, 0xCC, 0x75, 0x46,
                        /* 0008 */   0x90, 0x1C, 0x47, 0x56, 0xD7, 0xF2, 0xD4, 0x5D
                    })
                    

                    Method (HPPI, 4, NotSerialized)
                    {
                        If (LNotEqual (Arg1, 0x01))
                        {
                            Return (Buffer (0x01)
                            {
                                 0x00
                            })
                        }

                        If (LLessEqual (Arg2, 0x08))
                        {
                            If (LEqual (Arg2, 0x00))
                            {
                                Return (Buffer (0x02)
                                {
                                     0xFF, 0x01
                                })
                            }

                            If (LEqual (Arg2, 0x01))
                            {
                                Return (REV1) /* \_SB_.PCI0.LPCB.GTPM.REV1 */
                            }

                            If (LEqual (Arg2, 0x02))
                            {
                                Store (DerefOf (Index (Arg3, 0x00)), Local0)
                                Store ("TPM Func 2", Debug)
                                Store (Local0, Debug)
                                If (LLessEqual (Local0, 0x16))
                                {
                                    If (LOr (LEqual (Local0, 0x0C), LEqual (Local0, 0x0D)))
                                    {
                                        Return (0x01)
                                    }
                                    Else
                                    {
                                        If (LOr (LEqual (Local0, 0x13), LEqual (Local0, 0x14)))
                                        {
                                            Return (0x01)
                                        }
                                        Else
                                        {
                                            Store (0x02, Local2)
                                            \_SB.SSMI (0xEA7D, 0x05, 0x00, 0x00, 0x00)
                                            Store (ECX, Local1)
                                            If (LEqual (And (Local1, 0x01), 0x01))
                                            {
                                                If (LEqual (And (Local1, 0x02), 0x00))
                                                {
                                                    If (LOr (LEqual (Local0, 0x05), LEqual (Local0, 0x0E)))
                                                    {
                                                        Return (Local2)
                                                    }
                                                    Else
                                                    {
                                                        If (LOr (LEqual (Local0, 0x15), LEqual (Local0, 0x16)))
                                                        {
                                                            Return (Local2)
                                                        }
                                                    }
                                                }

                                                \_SB.SSMI (0xEA7E, 0x00, Local0, 0x00, 0x01)
                                                Store (EAX, Debug)
                                                Store (EBX, Debug)
                                                Store (ECX, Debug)
                                                If (LEqual (EBX, 0x00))
                                                {
                                                    Store (0x00, Local2)
                                                }
                                            }

                                            Return (Local2)
                                        }
                                    }
                                }
                                Else
                                {
                                    Return (0x01)
                                }
                            }

                            If (LEqual (Arg2, 0x03))
                            {
                                Store ("TPM Func 3", Debug)
                                \_SB.SSMI (0xEA7D, 0x00, 0x00, 0x00, 0x01)
                                Store (EAX, Debug)
                                Store (EBX, Debug)
                                Store (ECX, Debug)
                                Name (DSMB, Package (0x02)
                                {
                                    0x01, 
                                    0x00
                                })
                                If (LEqual (EBX, 0x00))
                                {
                                    Store (0x00, Index (DSMB, 0x00))
                                    Store (0x00, Index (DSMB, 0x01))
                                    Store (ECX, Local0)
                                    If (LLessEqual (Local0, 0x16))
                                    {
                                        Store (0x00, Index (DSMB, 0x00))
                                        Store (Local0, Index (DSMB, 0x01))
                                    }
                                }

                                Return (DSMB) /* \_SB_.PCI0.LPCB.GTPM.HPPI.DSMB */
                            }

                            If (LEqual (Arg2, 0x04))
                            {
                                Return (0x02)
                            }

                            If (LEqual (Arg2, 0x05))
                            {
                                Store ("TPM Func 5", Debug)
                                \_SB.SSMI (0xEA7D, 0x01, 0x00, 0x00, 0x01)
                                Name (DSMC, Package (0x03)
                                {
                                    0x01, 
                                    0x00, 
                                    0x00
                                })
                                Store (EAX, Debug)
                                Store (EBX, Debug)
                                Store (ECX, Debug)
                                If (LEqual (EBX, 0x00))
                                {
                                    Store (0x00, Index (DSMC, 0x00))
                                    Store (ECX, Index (DSMC, 0x01))
                                    \_SB.SSMI (0xEA7D, 0x02, 0x00, 0x00, 0x01)
                                    Store (ECX, Index (DSMC, 0x02))
                                }

                                Return (DSMC) /* \_SB_.PCI0.LPCB.GTPM.HPPI.DSMC */
                            }

                            If (LEqual (Arg2, 0x06))
                            {
                                Store ("TPM Func 6", Debug)
                                Return (0x03)
                            }

                            If (LEqual (Arg2, 0x07))
                            {
                                Store (DerefOf (Index (Arg3, 0x00)), Local0)
                                Store ("TPM Func 7", Debug)
                                Store (Local0, Debug)
                                If (LLessEqual (Local0, 0x16))
                                {
                                    If (LOr (LEqual (Local0, 0x0C), LEqual (Local0, 0x0D)))
                                    {
                                        Return (0x01)
                                    }
                                    Else
                                    {
                                        If (LOr (LEqual (Local0, 0x13), LEqual (Local0, 0x14)))
                                        {
                                            Return (0x01)
                                        }
                                        Else
                                        {
                                            Store (0x02, Local2)
                                            \_SB.SSMI (0xEA7D, 0x05, 0x00, 0x00, 0x00)
                                            Store (ECX, Local1)
                                            If (LEqual (And (Local1, 0x01), 0x01))
                                            {
                                                If (LEqual (And (Local1, 0x02), 0x00))
                                                {
                                                    If (LOr (LEqual (Local0, 0x05), LEqual (Local0, 0x0E)))
                                                    {
                                                        Return (0x03)
                                                    }
                                                    Else
                                                    {
                                                        If (LOr (LEqual (Local0, 0x15), LEqual (Local0, 0x16)))
                                                        {
                                                            Return (0x03)
                                                        }
                                                    }
                                                }

                                                \_SB.SSMI (0xEA7E, 0x00, Local0, 0x00, 0x01)
                                                Store (EAX, Debug)
                                                Store (EBX, Debug)
                                                Store (ECX, Debug)
                                                If (LEqual (EBX, 0x00))
                                                {
                                                    Store (0x00, Local2)
                                                }
                                            }

                                            Return (Local2)
                                        }
                                    }
                                }
                                Else
                                {
                                    Return (0x01)
                                }
                            }

                            If (LEqual (Arg2, 0x08))
                            {
                                Store (DerefOf (Index (Arg3, 0x00)), Local0)
                                Store ("TPM Func 8", Debug)
                                Store (Local0, Debug)
                                If (LLessEqual (Local0, 0x16))
                                {
                                    If (LOr (LEqual (Local0, 0x0C), LEqual (Local0, 0x0D)))
                                    {
                                        Return (0x00)
                                    }
                                    Else
                                    {
                                        If (LOr (LEqual (Local0, 0x13), LEqual (Local0, 0x14)))
                                        {
                                            Return (0x00)
                                        }
                                        Else
                                        {
                                            \_SB.SSMI (0xEA7D, 0x06, 0x00, Local0, 0x01)
                                            Store (EAX, Debug)
                                            Store (EBX, Debug)
                                            Store (ECX, Debug)
                                            If (LEqual (EBX, 0x00))
                                            {
                                                If (LEqual (ECX, 0x00))
                                                {
                                                    Store (0x03, Local2)
                                                }
                                                Else
                                                {
                                                    Store (0x04, Local2)
                                                }
                                            }

                                            Return (Local2)
                                        }
                                    }
                                }
                                Else
                                {
                                    Return (0x01)
                                }
                            }
                        }

                        Return (Buffer (0x01)
                        {
                             0x00
                        })
                    }

                    Method (HMOR, 4, NotSerialized)
                    {
                        If (LNotEqual (Arg1, 0x01))
                        {
                            Return (0x01)
                        }

                        If (LNotEqual (Arg2, 0x01))
                        {
                            Return (0x01)
                        }

                        Store (DerefOf (Index (Arg3, 0x00)), Local0)
                        \_SB.SSMI (0xEA7F, Local0, 0x00, 0x00, 0x01)
                        Store (0x00, Local0)
                        If (LNotEqual (EBX, 0x00))
                        {
                            Store (0x01, Local0)
                        }

                        Return (Local0)
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
                    Name (_UID, 0x00)  // _UID: Unique ID
                    Name (BUF0, ResourceTemplate()
{
    IRQNoFlags() { 0, 8, 11, 15 }

                        Memory32Fixed (ReadWrite,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y1E)
                    })

                    

                    
                    Name (_STA, 0x0F)
                    Method (_CRS, 0, NotSerialized) { Return (BUF0) }
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0200,             // Range Minimum
                            0x0200,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFFFF,             // Range Minimum
                            0xFFFF,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0xFFFF,             // Range Minimum
                            0xFFFF,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0xEF80,             // Range Minimum
                            0xEF80,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        
                    })
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A06"))  // _HID: Hardware ID
                    OperationRegion (SOCG, SystemIO, 0x4E, 0x02)
                    Field (SOCG, ByteAcc, NoLock, Preserve)
                    {
                        SIOI,   8, 
                        SIOD,   8
                    }

                    IndexField (SIOI, SIOD, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x01), 
                            ,   2, 
                        PPPW,   1, 
                        PPM,    1, 
                        Offset (0x02), 
                            ,   3, 
                        S1PW,   1, 
                            ,   3, 
                        S2PW,   1, 
                        Offset (0x04), 
                        PPXM,   2, 
                        Offset (0x0D), 
                        CR0D,   8, 
                        Offset (0x23), 
                        PPBS,   8, 
                        S1BS,   8, 
                        S2BS,   8, 
                        PPDM,   4, 
                        Offset (0x27), 
                        PPIQ,   4, 
                        Offset (0x28), 
                        S2IQ,   4, 
                        S1IQ,   4, 
                        Offset (0x2B), 
                        FRBS,   8, 
                        FRDM,   4
                    }

                    OperationRegion (SORT, SystemIO, 0x0210, 0x10)
                    Field (SORT, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x0C), 
                        GP1,    8, 
                        GP2,    5, 
                        Offset (0x0E), 
                        GP3,    8, 
                        GP4,    8
                    }

                    Mutex (SIOM, 0x00)
                    Name (MSPS, 0x00)
                    Name (MSPV, 0x00)
                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        ECM ()
                        If (LNotEqual (CR0D, 0x7A))
                        {
                            Store (0x00, SDFG) /* \SDFG */
                        }

                        DCM ()
                    }

                    Method (ECM, 0, NotSerialized)
                    {
                        Acquire (SIOM, 0xFFFF)
                        Store (0x55, SIOI) /* \_SB_.PCI0.LPCB.SIO_.SIOI */
                    }

                    Method (DCM, 0, NotSerialized)
                    {
                        Store (0xAA, SIOI) /* \_SB_.PCI0.LPCB.SIO_.SIOI */
                        Release (SIOM)
                    }

                    Method (GETS, 1, NotSerialized)
                    {
                        ECM ()
                        Store (0x00, Local0)
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (PPBS, Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (S1BS, Local0)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (S2BS, Local0)
                                }
                            }
                        }

                        Store (0x00, Local1)
                        If (And (Local0, 0xC0))
                        {
                            ShiftLeft (Local0, 0x02, Local1)
                        }

                        DCM ()
                        Return (Local1)
                    }

                    Method (GETR, 1, NotSerialized)
                    {
                        Name (GRES, Package (0x04)
                        {
                            0x00, 
                            0x00, 
                            0x00, 
                            0x00
                        })
                        ECM ()
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                        Store (0x00, Local2)
                        Store (0x00, Local3)
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (PPBS, Local0)
                            Store (PPIQ, Local2)
                            Store (PPDM, Local3)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (S1BS, Local0)
                                Store (S1IQ, Local2)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (S2BS, Local0)
                                    Store (FRBS, Local1)
                                    Store (S2IQ, Local2)
                                    Store (FRDM, Local3)
                                }
                            }
                        }

                        ShiftLeft (Local0, 0x02, Index (GRES, 0x00))
                        ShiftLeft (Local1, 0x03, Index (GRES, 0x01))
                        Store (0x00, Local4)
                        If (LGreater (Local2, 0x00))
                        {
                            ShiftLeft (0x01, Local2, Local4)
                        }

                        Store (Local4, Index (GRES, 0x02))
                        Store (0x00, Local4)
                        If (LAnd (LGreater (Local3, 0x00), LLess (Local3, 0x04)))
                        {
                            ShiftLeft (0x01, Local3, Local4)
                        }

                        Store (Local4, Index (GRES, 0x03))
                        DCM ()
                        Return (GRES) /* \_SB_.PCI0.LPCB.SIO_.GETR.GRES */
                    }

                    Method (SETR, 5, NotSerialized)
                    {
                        ECM ()
                        ShiftRight (Arg1, 0x02, Local0)
                        FindSetRightBit (Arg3, Local1)
                        If (LAnd (LGreater (Local1, 0x01), LLess (Local1, 0x11)))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local1)
                        }

                        FindSetRightBit (Arg4, Local2)
                        If (LAnd (LGreater (Local2, 0x01), LLess (Local2, 0x05)))
                        {
                            Decrement (Local2)
                        }
                        Else
                        {
                            Store (0x0F, Local2)
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Local0, PPBS) /* \_SB_.PCI0.LPCB.SIO_.PPBS */
                            Store (Local1, PPIQ) /* \_SB_.PCI0.LPCB.SIO_.PPIQ */
                            Store (Local2, PPDM) /* \_SB_.PCI0.LPCB.SIO_.PPDM */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                And (Local0, 0xFE, S1BS) /* \_SB_.PCI0.LPCB.SIO_.S1BS */
                                Store (Local1, S1IQ) /* \_SB_.PCI0.LPCB.SIO_.S1IQ */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    And (Local0, 0xFE, S2BS) /* \_SB_.PCI0.LPCB.SIO_.S2BS */
                                    ShiftRight (Arg2, 0x03, FRBS) /* \_SB_.PCI0.LPCB.SIO_.FRBS */
                                    Store (Local1, S2IQ) /* \_SB_.PCI0.LPCB.SIO_.S2IQ */
                                    Store (Local2, FRDM) /* \_SB_.PCI0.LPCB.SIO_.FRDM */
                                }
                            }
                        }

                        DCM ()
                    }

                    Method (GLPM, 0, NotSerialized)
                    {
                        ECM ()
                        Store (PPM, Local0)
                        Store (PPXM, Local1)
                        DCM ()
                        If (Local0)
                        {
                            Store (0x00, Local2)
                        }
                        Else
                        {
                            Store (0x03, Local2)
                            If (LEqual (Local1, 0x00))
                            {
                                Store (0x01, Local2)
                            }

                            If (LEqual (Local1, 0x01))
                            {
                                Store (0x02, Local2)
                            }
                        }

                        Return (Local2)
                    }

                    Method (DPWS, 1, Serialized)
                    {
                        ECM ()
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (PPPW, Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (S1PW, Local0)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (S2PW, Local0)
                                }
                            }
                        }

                        DCM ()
                        Return (Local0)
                    }

                    Method (DPW, 2, Serialized)
                    {
                        ECM ()
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Arg1, PPPW) /* \_SB_.PCI0.LPCB.SIO_.PPPW */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, S1PW) /* \_SB_.PCI0.LPCB.SIO_.S1PW */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (Arg1, S2PW) /* \_SB_.PCI0.LPCB.SIO_.S2PW */
                                }
                            }
                        }

                        DCM ()
                    }

                    Method (GDPA, 0, Serialized)
                    {
                        Store (GETS (0x02), Local0)
                        Return (Local0)
                    }

                    Alias (GDPA, \_SB.GDPA)
                    Method (SODS, 2, Serialized)
                    {
                        And (Not (SDFG), Arg1, Local1)
                        If (LOr (LEGF, Local1))
                        {
                            Store (0x00, Local0)
                        }
                        Else
                        {
                            Store (GETS (Arg0), Local1)
                            Store (0x0D, Local0)
                            If (Local1)
                            {
                                Store (0x0F, Local0)
                            }
                        }

                        Return (Local0)
                    }

                    Method (DSOD, 1, Serialized)
                    {
                        If (GETS (Arg0))
                        {
                            Store (GETR (Arg0), Local0)
                            Store (DerefOf (Index (Local0, 0x01)), Local1)
                            Store (DerefOf (Index (Local0, 0x02)), Local2)
                            Store (DerefOf (Index (Local0, 0x03)), Local3)
                            Store (DerefOf (Index (Local0, 0x00)), Local4)
                            Or (ShiftLeft (Local4, 0x08), Local3, Local3)
                            \_SB.PCI0.LPCB.CFG (Arg0, 0x00, Local1, Local2, Local3)
                            SETR (Arg0, 0x00, 0x00, 0x00, 0x00)
                        }
                    }

                    Device (HCOM)
                    {
                        Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                        Name (_UID, 0x04)  // _UID: Unique ID
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (CMRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y1F)
                            })
                            CreateWordField (CMRS, \_SB.PCI0.LPCB.SIO.HCOM._CRS._Y1F._MIN, MIN1)  // _MIN: Minimum Base Address
                            CreateWordField (CMRS, \_SB.PCI0.LPCB.SIO.HCOM._CRS._Y1F._MAX, MAX1)  // _MAX: Maximum Base Address
                            Store (GETR (0x02), Local1)
                            Store (DerefOf (Index (Local1, 0x00)), MIN1) /* \_SB_.PCI0.LPCB.SIO_.HCOM._CRS.MIN1 */
                            Store (MIN1, MAX1) /* \_SB_.PCI0.LPCB.SIO_.HCOM._CRS.MAX1 */
                            Return (CMRS) /* \_SB_.PCI0.LPCB.SIO_.HCOM._CRS.CMRS */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Store (0x00, Local0)
                            If (LEGF)
                            {
                                If (GETS (0x02))
                                {
                                    Store (0x0F, Local0)
                                }
                            }

                            Return (Local0)
                        }
                    }

                    Device (COM1)
                    {
                        Name (_HID, EisaId ("PNP0501"))  // _HID: Hardware ID
                        Name (_CID, EisaId ("PNP0500"))  // _CID: Compatible ID
                        Name (_DDN, "COM1")  // _DDN: DOS Device Name
                        Name (RCOD, 0x00)
                        Name (POSS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            EndDependentFn ()
                        })
                        Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                        {
                            Return (POSS) /* \_SB_.PCI0.LPCB.SIO_.COM1.POSS */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Store (0x00, Local0)
                            If (LOr (\_SB.DCKD (), ICPT))
                            {
                                If (LNot (RCOD))
                                {
                                    Store (SODS (0x02, 0x02), Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }

                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                        {
                            DSOD (0x02)
                            Return (0x00)
                        }

                        Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x02, MIN1)
                            CreateWordField (Arg0, 0x09, IRQ0)
                            If (SODS (0x02, 0x02))
                            {
                                _DIS ()
                                \_SB.PCI0.LPCB.CFG (0x02, MIN1, 0x00, IRQ0, 0x00)
                                SETR (0x02, MIN1, 0x00, IRQ0, 0x00)
                            }

                            Store (0x00, RCOD) /* \_SB_.PCI0.LPCB.SIO_.COM1.RCOD */
                        }

                        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                        {
                            Name (CRES, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y20)
                                IRQNoFlags (_Y21)
                                    {4}
                            })
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.COM1._CRS._Y20._MIN, MIN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.COM1._CRS._Y20._MAX, MAX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.COM1._CRS._Y21._INT, IRQ0)  // _INT: Interrupts
                            If (RCOD)
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Store (SODS (0x02, 0x02), Local0)
                            }

                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, MIN1) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.MIN1 */
                                Store (0x00, MAX1) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.MAX1 */
                                Store (0x00, IRQ0) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.IRQ0 */
                                Return (CRES) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.CRES */
                            }

                            Store (GETR (0x02), Local1)
                            Store (DerefOf (Index (Local1, 0x00)), MIN1) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.MIN1 */
                            Store (MIN1, MAX1) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.MAX1 */
                            Store (DerefOf (Index (Local1, 0x02)), IRQ0) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.IRQ0 */
                            Return (CRES) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.CRES */
                        }

                        PowerResource (COMP, 0x00, 0x0000)
                        {
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (DPWS (0x02))
                            }

                            Method (_ON, 0, NotSerialized)  // _ON_: Power On
                            {
                                DPW (0x02, 0x01)
                            }

                            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                            {
                            }
                        }

                        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                        {
                            COMP
                        })
                    }

                    Device (LPT0)
                    {
                        Method (_HID, 0, Serialized)  // _HID: Hardware ID
                        {
                            If (GTM ())
                            {
                                Store (0x0104D041, Local0)
                            }
                            Else
                            {
                                Store (0x0004D041, Local0)
                            }

                            Return (Local0)
                        }

                        Name (LPM, 0xFF)
                        Method (GTM, 0, Serialized)
                        {
                            If (LEqual (LPM, 0xFF))
                            {
                                Store (GLPM (), Local0)
                                Store (0x00, LPM) /* \_SB_.PCI0.LPCB.SIO_.LPT0.LPM_ */
                                If (LGreater (Local0, 0x01))
                                {
                                    Store (0x01, LPM) /* \_SB_.PCI0.LPCB.SIO_.LPT0.LPM_ */
                                }
                            }

                            Return (LPM) /* \_SB_.PCI0.LPCB.SIO_.LPT0.LPM_ */
                        }

                        Name (RLPD, 0x00)
                        Name (POSS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x00)
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x00, 0x00)
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            EndDependentFn ()
                        })
                        Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                        {
                            Return (POSS) /* \_SB_.PCI0.LPCB.SIO_.LPT0.POSS */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (RLPD)
                            {
                                Store (0x0D, Local0)
                            }
                            Else
                            {
                                Store (SODS (0x01, 0x04), Local0)
                            }

                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                        {
                            DSOD (0x01)
                            Return (0x00)
                        }

                        Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x02, MIN1)
                            CreateWordField (Arg0, 0x0A, MIN2)
                            CreateWordField (Arg0, 0x11, IRQ0)
                            CreateWordField (Arg0, 0x14, DMA0)
                            If (SODS (0x01, 0x04))
                            {
                                _DIS ()
                                \_SB.PCI0.LPCB.CFG (0x01, MIN1, MIN2, IRQ0, DMA0)
                                SETR (0x01, MIN1, MIN2, IRQ0, DMA0)
                            }

                            Store (0x00, RLPD) /* \_SB_.PCI0.LPCB.SIO_.LPT0.RLPD */
                        }

                        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                        {
                            Name (CRES, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y22)
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    _Y23)
                                IRQNoFlags (_Y24)
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, _Y25)
                                    {3}
                            })
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y22._MIN, MIN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y22._MAX, MAX1)  // _MAX: Maximum Base Address
                            CreateByteField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y22._LEN, LEN1)  // _LEN: Length
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y23._MIN, MIN2)  // _MIN: Minimum Base Address
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y23._MAX, MAX2)  // _MAX: Maximum Base Address
                            CreateByteField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y23._LEN, LEN2)  // _LEN: Length
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y24._INT, IRQ0)  // _INT: Interrupts
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y25._DMA, DMA0)  // _DMA: Direct Memory Access
                            If (RLPD)
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Store (SODS (0x01, 0x04), Local0)
                            }

                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, MIN1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MIN1 */
                                Store (0x00, MAX1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MAX1 */
                                Store (0x00, MIN2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MIN2 */
                                Store (0x00, MAX2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MAX2 */
                                Store (0x00, IRQ0) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.IRQ0 */
                                Store (0x00, DMA0) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.DMA0 */
                                Return (CRES) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.CRES */
                            }

                            Store (GETR (0x01), Local1)
                            Store (DerefOf (Index (Local1, 0x00)), MIN1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MIN1 */
                            Store (MIN1, MAX1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MAX1 */
                            If (LEqual (MIN1, 0x0278))
                            {
                                Store (0x08, LEN1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.LEN1 */
                                Store (0x03, LEN2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.LEN2 */
                            }

                            If (LEqual (MIN1, 0x03BC))
                            {
                                Store (0x04, LEN1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.LEN1 */
                                Store (0x03, LEN2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.LEN2 */
                            }

                            Add (MIN1, 0x0400, MIN2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MIN2 */
                            Store (MIN2, MAX2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MAX2 */
                            Store (DerefOf (Index (Local1, 0x02)), IRQ0) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.IRQ0 */
                            Store (DerefOf (Index (Local1, 0x03)), DMA0) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.DMA0 */
                            Return (CRES) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.CRES */
                        }

                        PowerResource (LPP, 0x00, 0x0000)
                        {
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (DPWS (0x01))
                            }

                            Method (_ON, 0, NotSerialized)  // _ON_: Power On
                            {
                                DPW (0x01, 0x01)
                            }

                            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                            {
                            }
                        }

                        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                        {
                            LPP
                        })
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("HPQ8001"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0303"))  // _CID: Compatible ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            FixedIO (
                                0x0060,             // Address
                                0x01,               // Length
                                )
                            FixedIO (
                                0x0064,             // Address
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                    Method (_DSM, 4, NotSerialized)
                    {
                        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                        Return (Package()
                        {
                            // Note: Function key part seems to not be necessary        // "AAPL,has-embedded-fn-keys", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                            "RM,oem-id", "HPQOEM",
                            "RM,oem-table-id", "161C",
                        })
                    }
                    
                }

                Device (PS2M)
                {
                    Name (_CID, Package (0x03)  // _CID: Compatible ID
                    {
                        EisaId ("SYN0100"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                    Offset (0x08), 
                    SYNC,   4, 
                    Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                    Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                    Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                    Offset (0x50), 
                    MAPV,   2
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                    Offset (0x08), 
                    SYNC,   4, 
                    Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                    Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                    Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                    Offset (0x50), 
                    MAPV,   2
                }
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                OperationRegion (SMBP, PCI_Config, 0x40, 0xC0)
                Field (SMBP, DWordAcc, NoLock, Preserve)
                {
                        ,   2, 
                    I2CE,   1
                }

                OperationRegion (SMBI, SystemIO, 0xEF80, 0x10)
                Field (SMBI, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                    Offset (0x02), 
                    HCON,   8, 
                    HCOM,   8, 
                    TXSA,   8, 
                    DAT0,   8, 
                    DAT1,   8, 
                    HBDR,   8, 
                    PECR,   8, 
                    RXSA,   8, 
                    SDAT,   16
                }

                Method (SSXB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Arg0, TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (0x48, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRXB, 1, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Or (Arg0, 0x01), TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (0x44, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    }

                    Return (0xFFFF)
                }

                Method (SWRB, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Arg0, TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (Arg2, DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    Store (0x48, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRDB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Or (Arg0, 0x01), TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (0x48, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    }

                    Return (0xFFFF)
                }

                Method (SWRW, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Arg0, TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    And (Arg2, 0xFF, DAT1) /* \_SB_.PCI0.SBUS.DAT1 */
                    And (ShiftRight (Arg2, 0x08), 0xFF, DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    Store (0x4C, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRDW, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Or (Arg0, 0x01), TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (0x4C, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (Or (ShiftLeft (DAT0, 0x08), DAT1))
                    }

                    Return (0xFFFFFFFF)
                }

                Method (SBLW, 4, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg3, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Arg0, TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (SizeOf (Arg2), DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    Store (0x00, Local1)
                    Store (DerefOf (Index (Arg2, 0x00)), HBDR) /* \_SB_.PCI0.SBUS.HBDR */
                    Store (0x54, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    While (LGreater (SizeOf (Arg2), Local1))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (0x80, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Increment (Local1)
                        If (LGreater (SizeOf (Arg2), Local1))
                        {
                            Store (DerefOf (Index (Arg2, Local1)), HBDR) /* \_SB_.PCI0.SBUS.HBDR */
                        }
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SBLR, 3, Serialized)
                {
                    Name (TBUF, Buffer (0x0100) {})
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg2, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Or (Arg0, 0x01), TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (0x54, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    Store (0x0FA0, Local0)
                    While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                    {
                        Decrement (Local0)
                        Stall (0x32)
                    }

                    If (LNot (Local0))
                    {
                        KILL ()
                        Return (0x00)
                    }

                    Store (DAT0, Index (TBUF, 0x00))
                    Store (0x80, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (0x01, Local1)
                    While (LLess (Local1, DerefOf (Index (TBUF, 0x00))))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (HBDR, Index (TBUF, Local1))
                        Store (0x80, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Increment (Local1)
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (TBUF) /* \_SB_.PCI0.SBUS.SBLR.TBUF */
                    }

                    Return (0x00)
                }

                Method (STRT, 0, Serialized)
                {
                    Store (0xC8, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x40))
                        {
                            Decrement (Local0)
                            Sleep (0x01)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x01)
                            }
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }
                    }

                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x01))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Return (0x01)
                }

                Method (COMP, 0, Serialized)
                {
                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x02))
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                    }

                    Return (0x00)
                }

                Method (KILL, 0, Serialized)
                {
                    Or (HCON, 0x02, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                }
                Device (BUS0)
                {
                    Name (_CID, "smbus")
                    Name (_ADR, Zero)
                    Device (DVL0)
                    {
                        Name (_ADR, 0x57)
                        Name (_CID, "diagsvault")
                        Method (_DSM, 4, NotSerialized)
                        {
                            If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                            Return (Package() { "address", 0x57 })
                        }
                    }
                }
            }

            Scope (\)
            {
                OperationRegion (THMR, SystemMemory, TBRB, 0xDC)
                Field (THMR, AnyAcc, Lock, Preserve)
                {
                    Offset (0x30), 
                    CTV1,   16, 
                    CTV2,   16, 
                    Offset (0x60), 
                    PTV,    8, 
                    Offset (0xD8), 
                    PCHT,   8, 
                    MCHT,   8
                }
            }

            Device (RP01)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP01.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP01.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP01.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP01.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP01.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP01.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP01.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP01.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP01.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP01.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP01.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP01.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP01.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP02.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP02.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP02.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP02.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP02.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP02.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP02.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP02.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP02.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP02.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP02.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP02.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP02.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKA, 
                                0x00
                            }
                        })
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Device (ECF0)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
                    {
                        Return (^^_PRW) /* \_SB_.PCI0.RP02._PRW */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (0x01)
                    }
                }

                Device (ECF1)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                }

                Device (ECF2)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                }

                Device (ECF3)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                }

                Device (ECF4)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                }

                Device (ECF5)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                }

                Device (ECF6)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                }

                Device (ECF7)
                {
                    Name (_ADR, 0x07)  // _ADR: Address
                }

                Scope (ECF0)
                {
                    Method (_EJD, 0, NotSerialized)  // _EJD: Ejection Dependent Device
                    {
                        Return ("\\_SB.PCI0.EH01.RHUB.PRT0.HPT4")
                    }
                }
            }

            Device (RP03)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP03.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP03.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP03.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP03.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP03.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP03.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP03.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP03.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP03.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP03.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP03.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP03.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP03.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKB, 
                                0x00
                            }
                        })
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Device (SMHC)
                {
                    OperationRegion (JMDE, PCI_Config, 0xAC, 0x10)
                    Field (JMDE, AnyAcc, NoLock, Preserve)
                    {
                            ,   6, 
                        D3EF,   1, 
                        Offset (0x01)
                    }

                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        
                        Return (Zero)

                    }
                }

                Device (MSHC)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        
                        Return (Zero)

                    }
                }

                Device (XDCC)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        
                        Return (Zero)

                    }
                }

                Device (I1C)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        
                        Return (Zero)

                    }
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP04.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP04.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP04.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP04.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP04.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP04.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP04.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP04.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP04.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP04.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP04.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP04.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP04.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKC, 
                                0x00
                            }
                        })
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x05
                })
                Device (ARPT)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
                    {
                        Return (^^_PRW) /* \_SB_.PCI0.RP04._PRW */
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }
                    Method (_DSM, 4, NotSerialized)
                    {
                        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                        Return (Package()
                        {
                            "device-id", Buffer() { 0xa0, 0x43, 0x00, 0x00 },
                            "compatible", Buffer() { "pci14e4,43a0" },
                            "name", "AirPort Extreme",
                            "model", Buffer() { "Broadcom BCM4322x 802.11 b/g/n Wireless Network Adapter" },
                            "AAPL,slot-name", Buffer() { "AirPort" },
                            "device_type", Buffer() { "AirPort" },
                            "built-in", Buffer () {0x00},
                            //"subsystem-id", Buffer() { 0x8F, 0x00, 0x00, 0x00 },
                            //"subsystem-vendor-id", Buffer() { 0x6B, 0x10, 0x00, 0x00 },
                        })
                    }
                }
            }

            Device (RP05)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP05.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP05.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP05.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP05.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP05.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP05.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP05.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP05.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP05.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP05.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP05.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP05.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP05.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (^^RP01._PRT ())
                }
            }

            Device (RP06)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP06.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP06.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP06.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP06.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP06.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP06.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP06.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP06.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP06.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP06.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP06.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP06.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP06.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (^^RP02._PRT ())
                }
            }

            Device (RP07)
            {
                Name (_ADR, 0x001C0006)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP7D))
                }

                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP07.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP07.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP07.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP07.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP07.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP07.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP07.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP07.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP07.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP07.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP07.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP07.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP07.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (^^RP03._PRT ())
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
            }

            Device (RP08)
            {
                Name (_ADR, 0x001C0007)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP8D))
                }

                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP08.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP08.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP08.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP08.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP08.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP08.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP08.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP08.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP08.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP08.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP08.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP08.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP08.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (^^RP04._PRT ())
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (UPRW (0x09, 0x04))
                }
            }

            Method (POSC, 2, Serialized)
            {
                If (LOr (Arg1, LOr (And (Arg0, 0x01), And (Arg0, 
                    0x04))))
                {
                    XOr (And (Arg0, 0x01), 0x01, Local4)
                    XOr (And (ShiftRight (Arg0, 0x02), 0x01), 0x01, Local5)
                    \_SB.PCI0.RP01.OSC (Local4, Local5)
                    \_SB.PCI0.RP02.OSC (Local4, Local5)
                    If (LAnd (\_SB.PCI0.RP03.HPCE, 0x00))
                    {
                        \_SB.PCI0.RP03.OSC (Local4, Local5)
                    }
                    Else
                    {
                        \_SB.PCI0.RP03.OSC (0x01, Local5)
                    }

                    \_SB.PCI0.RP04.OSC (Local4, Local5)
                    \_SB.PCI0.RP05.OSC (Local4, Local5)
                    \_SB.PCI0.RP06.OSC (Local4, Local5)
                    \_SB.PCI0.RP07.OSC (Local4, Local5)
                    \_SB.PCI0.RP08.OSC (Local4, Local5)
                    Store (Local5, \_SB.PCI0.LPCB.BPEE)
                }
            }

            Device (B0D4)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
            }

            Scope (\)
            {
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x22), 
                    GPIS,   16, 
                    Offset (0x2A), 
                    GPIE,   16, 
                    Offset (0x30), 
                    GSIE,   1, 
                    EOS,    1, 
                        ,   2, 
                    SSME,   1, 
                    SWSM,   1, 
                    Offset (0x34), 
                        ,   5, 
                    APMS,   1, 
                    Offset (0x38), 
                    AGSE,   16, 
                    AGSS,   16
                }

                Field (GPIO, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x04), 
                    GPSL,   32, 
                    Offset (0x0C), 
                    GPL0,   32, 
                    Offset (0x2C), 
                    GIV,    32, 
                    Offset (0x38), 
                    GPL2,   32, 
                    Offset (0x48), 
                    GPL3,   32
                }
            }

            Method (GUPT, 1, NotSerialized)
            {
                And (Arg0, 0x0F, Local2)
                Store (0x06, Local1)
                If (LEqual (Arg0, 0x001D0003))
                {
                    Store (0x0A, Local0)
                    Return (Local0)
                }

                ShiftLeft (Local2, 0x01, Local0)
                If (LEqual (And (Arg0, 0x001A0000), 0x001A0000))
                {
                    Add (Local0, Local1, Local0)
                }

                Return (Local0)
            }

            Method (UPSW, 1, Serialized)
            {
                Store (0x01, Local0)
                ShiftRight (0x3C13, Arg0, Local1)
                And (Local1, 0x01, Local0)
                Return (Local0)
            }

            Method (\_SB.PCI0.GSWS, 1, NotSerialized)
            {
                While (APMS)
                {
                    Stall (0x01)
                }

                While (LNotEqual (SWSM, 0x01))
                {
                    Store (0x01, SWSM) /* \SWSM */
                }

                Store (0xF3, SSMP) /* \SSMP */
                Stall (0x32)
                While (APMS)
                {
                    Stall (0x01)
                }
            }

            Mutex (SMIM, 0x00)
            Name (SMIS, 0x00)
            Name (SMID, 0x00)
            Method (DSMI, 0, NotSerialized)
            {
                Acquire (SMIM, 0xFFFF)
                If (LEqual (SMID, 0x00))
                {
                    Store (0x00, GSIE) /* \GSIE */
                    Store (0x00, EOS) /* \EOS_ */
                }

                Increment (SMID)
                Release (SMIM)
            }

            Method (ESMI, 0, NotSerialized)
            {
                Acquire (SMIM, 0xFFFF)
                Decrement (SMID)
                If (LEqual (SMID, 0x00))
                {
                    Store (0x01, EOS) /* \EOS_ */
                    Store (0x01, GSIE) /* \GSIE */
                }

                Release (SMIM)
            }

            Alias (DSMI, \DSMI)
            Alias (ESMI, \ESMI)
            Name (PUID, Buffer (0x10)
            {
                /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
            })
            Name (XCNT, 0x00)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, 0x00, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (\_SB.PCI0.XHC.CUID (Arg0))
                {
                    Return (\_SB.PCI0.XHC.POSC (Arg1, Arg2, Arg3))
                }
                Else
                {
                    If (LGreaterEqual (OSYS, 0x07DC))
                    {
                        If (LEqual (XCNT, 0x00))
                        {
                            \_SB.PCI0.XHC.XSEL ()
                            Increment (XCNT)
                        }
                    }
                }

                Store (Arg0, Local1)
                If (LEqual (\SRCP (Local1, PUID), 0x01))
                {
                    Store (CDW2, Local2)
                    Store (CDW3, Local3)
                    If (LNotEqual (And (Local2, 0x16), 0x16))
                    {
                        And (Local3, 0x1E, Local3)
                    }

                    And (Local3, 0x1D, Local3)
                    If (LNot (And (CDW1, 0x01)))
                    {
                        POSC (Local3, 0x01)
                        If (And (Local3, 0x10)) {}
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    If (LNotEqual (CDW3, Local3))
                    {
                        Or (CDW1, 0x10, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    Store (Local3, CDW3) /* \_SB_.PCI0._OSC.CDW3 */
                    Store (Local3, OSCC) /* \OSCC */
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    Return (Arg3)
                }
            }

            Method (ICST, 1, NotSerialized)
            {
                Store (0x0F, Local0)
                If (LEqual (Arg0, 0x01))
                {
                    Store (0x00, Local0)
                }

                Return (Local0)
            }

            Scope (RP01)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP1D))
                }
            }

            Scope (RP02)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP2D))
                }
            }

            Scope (RP03)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP3D))
                }
            }

            Scope (RP04)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP4D))
                }
            }

            Scope (RP05)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP5D))
                }
            }

            Scope (RP06)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP6D))
                }
            }

            Scope (HDEF)
            {
                Name (ASTA, 0x00)
                Name (ASTI, 0x00)
                PowerResource (APPR, 0x00, 0x0000)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (ASTA) /* \_SB_.PCI0.HDEF.ASTA */
                    }

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        Store (0x01, ASTA) /* \_SB_.PCI0.HDEF.ASTA */
                        Store (\_SB.PCI0.LPCB.EC0.SAST (0x01), ASTI) /* \_SB_.PCI0.HDEF.ASTI */
                    }

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        Store (0x00, ASTA) /* \_SB_.PCI0.HDEF.ASTA */
                        Store (\_SB.PCI0.LPCB.EC0.SAST (0x00), ASTI) /* \_SB_.PCI0.HDEF.ASTI */
                    }
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    APPR
                })
            }

            Scope (LPCB)
            {
                OperationRegion (LPC2, PCI_Config, 0x80, 0x3C)
                Field (LPC2, AnyAcc, NoLock, Preserve)
                {
                    CMAD,   3, 
                        ,   1, 
                    CMBD,   3, 
                    Offset (0x01), 
                    LPDC,   2, 
                        ,   2, 
                    FDDC,   1, 
                    Offset (0x02), 
                    CALE,   1, 
                    CBLE,   1, 
                    LLPE,   1, 
                    FDLE,   1, 
                    Offset (0x08), 
                    G2DC,   16, 
                    G2MK,   8, 
                    Offset (0x20), 
                        ,   10, 
                    BPEE,   1, 
                    Offset (0x38), 
                    GPRO,   32
                }

                Name (CDC, Package (0x08)
                {
                    0x03F8, 
                    0x02F8, 
                    0x0220, 
                    0x0228, 
                    0x0238, 
                    0x02E8, 
                    0x0338, 
                    0x03E8
                })
                Name (LPD, Package (0x03)
                {
                    0x0378, 
                    0x0278, 
                    0x03BC
                })
                Method (\_SB.PCI0.LPCB.SMAB, 3, Serialized)
                {
                    If (LEqual (And (Arg0, 0x01), 0x00))
                    {
                        Store (0x01, Local0)
                        Store (\_SB.PCI0.SBUS.SWRB (Arg0, Arg1, Arg2), Local1)
                        If (Local1)
                        {
                            Store (0x00, Local0)
                        }
                    }
                    Else
                    {
                        Store (\_SB.PCI0.SBUS.SRDB (Arg0, Arg1), Local0)
                    }

                    Return (Local0)
                }

                Method (DCS, 3, NotSerialized)
                {
                    Store (0x00, Local1)
                    Store (Match (Arg0, MEQ, Arg1, MTR, 0x00, 0x00), Local0)
                    If (LNotEqual (Local0, Ones))
                    {
                        ShiftLeft (Local0, Arg2, Local1)
                    }

                    Return (Local1)
                }

                Method (DPD, 2, Serialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (0x00, FDLE) /* \_SB_.PCI0.LPCB.FDLE */
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (0x00, LLPE) /* \_SB_.PCI0.LPCB.LLPE */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (0x00, CALE) /* \_SB_.PCI0.LPCB.CALE */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (0x00, CBLE) /* \_SB_.PCI0.LPCB.CBLE */
                                    And (G2DC, Not (0x01), G2DC) /* \_SB_.PCI0.LPCB.G2DC */
                                }
                            }
                        }
                    }
                }

                Method (EPD, 3, Serialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (0x00, Local0)
                        If (LEqual (Arg1, 0x0370))
                        {
                            Store (0x01, Local0)
                        }

                        Store (Local0, FDDC) /* \_SB_.PCI0.LPCB.FDDC */
                        Store (0x01, FDLE) /* \_SB_.PCI0.LPCB.FDLE */
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (DCS (LPD, Arg1, 0x00), LPDC) /* \_SB_.PCI0.LPCB.LPDC */
                            Store (0x01, LLPE) /* \_SB_.PCI0.LPCB.LLPE */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (DCS (CDC, Arg1, 0x00), CMAD) /* \_SB_.PCI0.LPCB.CMAD */
                                Store (0x01, CALE) /* \_SB_.PCI0.LPCB.CALE */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (DCS (CDC, Arg1, 0x00), CMBD) /* \_SB_.PCI0.LPCB.CMBD */
                                    Store (0x01, CBLE) /* \_SB_.PCI0.LPCB.CBLE */
                                    Store (0x0C, G2MK) /* \_SB_.PCI0.LPCB.G2MK */
                                    Or (Arg2, 0x01, G2DC) /* \_SB_.PCI0.LPCB.G2DC */
                                }
                            }
                        }
                    }
                }

                Method (CFG, 5, Serialized)
                {
                    If (LEqual (Arg1, 0x00))
                    {
                        ^DPD (Arg0, Arg2)
                    }
                    Else
                    {
                        ^EPD (Arg0, Arg1, Arg2)
                    }
                }
            }

            Device (ACEL)
            {
                Name (_HID, EisaId ("HPQ6000"))  // _HID: Hardware ID
                Name (DEPT, 0xFF)
                Name (CTST, 0xFF)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    ITAL ()
                }

                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000017,
                    }
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (LEqual (DEPT, 0xFF))
                    {
                        Store (0x0F, Local0)
                        Store (ALRD (0x20), Local1)
                        If (And (Local1, 0xFF00))
                        {
                            Store (0x00, Local0)
                        }

                        Store (Local0, DEPT) /* \_SB_.PCI0.ACEL.DEPT */
                    }

                    Return (DEPT) /* \_SB_.PCI0.ACEL.DEPT */
                }

                Method (ITAL, 0, Serialized)
                {
                    If (_STA ())
                    {
                        ALWR (0x20, 0x5F)
                        ALWR (0x21, 0x22)
                        ALWR (0x32, 0x16)
                        ALWR (0x33, 0x02)
                        ALWR (0x30, 0x95)
                        ALWR (0x36, 0x13)
                        ALWR (0x37, 0x01)
                        ALWR (0x34, 0x0A)
                        Store (0xFF, CTST) /* \_SB_.PCI0.ACEL.CTST */
                        AJAL ()
                    }
                }

                Method (AJAL, 0, Serialized)
                {
                    If (_STA ())
                    {
                        Store (\_SB.PCI0.LPCB.EC0.GACS (), Local0)
                        If (LAnd (LEqual (\_SB.LID._LID (), 0x00), LEqual (Local0, 0x00)))
                        {
                            If (LNotEqual (CTST, 0x01))
                            {
                                Store (0x01, CTST) /* \_SB_.PCI0.ACEL.CTST */
                                ALWR (0x22, 0x60)
                            }
                        }
                        Else
                        {
                            If (LNotEqual (CTST, 0x00))
                            {
                                Store (0x00, CTST) /* \_SB_.PCI0.ACEL.CTST */
                                ALWR (0x22, 0x40)
                            }
                        }
                    }
                }

                Method (CLRI, 0, Serialized)
                {
                    Store (0x00, Local2)
                    If (LEqual (\_SB.PCI0.LPCB.EC0.GACS (), 0x00))
                    {
                        Store (0x04, Local0)
                        Store (0x04, Local1)
                        If (LEqual (\_SB.BAT0._STA (), 0x1F))
                        {
                            Store (DerefOf (Index (DerefOf (Index (NBST, 0x00)), 0x00)), 
                                Local0)
                        }

                        If (LEqual (\_SB.BAT1._STA (), 0x1F))
                        {
                            Store (DerefOf (Index (DerefOf (Index (NBST, 0x01)), 0x00)), 
                                Local1)
                        }

                        And (Local0, Local1, Local0)
                        If (And (Local0, 0x04))
                        {
                            Store (0x01, Local2)
                        }
                    }

                    Return (Local2)
                }

                Method (ALRD, 1, Serialized)
                {
                    Store (\_SB.PCI0.LPCB.SMAB (0x53, Arg0, 0x00), Local0)
                    Return (Local0)
                }

                Method (ALWR, 2, Serialized)
                {
                    Store (\_SB.PCI0.LPCB.SMAB (0x52, Arg0, Arg1), Local0)
                    Return (Local0)
                }

                Method (ALID, 1, Serialized)
                {
                    Return (\_SB.LID._LID ())
                }

                Method (ADSN, 0, Serialized)
                {
                    Store (HDDS, Local0)
                    Store (0x00, Local0)
                    Return (Local0)
                }
            }

            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (GPIC)
                {
                    Return (Package (0x1A)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            0x00, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            0x00, 
                            0x12
                        }
                    })
                }
                Else
                {
                    Return (Package (0x1A)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x00, 
                            LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            LNKF, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x02, 
                            LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x03, 
                            LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x01, 
                            LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x02, 
                            LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x03, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            LNKC, 
                            0x00
                        }
                    })
                }
            }

            Method (PCIB._PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (GPIC)
                {
                    Return (Package (0x06)
                    {
                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            0x00, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x04, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x05, 
                            0x00, 
                            0x16
                        }
                    })
                }
                Else
                {
                    Return (Package (0x06)
                    {
                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            LNKE, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x04, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x05, 
                            LNKG, 
                            0x00
                        }
                    })
                }
            }

            Field (GPIO, ByteAcc, NoLock, Preserve)
            {
                Offset (0x0C), 
                Offset (0x0C), 
                GLEP,   1
            }

            Scope (RP06)
            {
                Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
                {
                    Store (Package (0x02)
                        {
                            0x09, 
                            0x05
                        }, Local0)
                    If (WOLD)
                    {
                        Store (0x00, Index (Local0, 0x01))
                    }

                    Return (Local0)
                }

                OperationRegion (NPCI, PCI_Config, 0x19, 0x01)
                Field (NPCI, ByteAcc, NoLock, Preserve)
                {
                    BUSN,   8
                }

                Method (GADD, 0, Serialized)
                {
                    Store (BUSN, Local0)
                    ShiftLeft (Local0, 0x14, Local0)
                    Add (0xE0000000, Local0, Local1)
                    Return (Local1)
                }

                Device (NIC)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
                    {
                        Return (^^_PRW ())
                    }

                    Method (EJ0, 0, NotSerialized)
                    {
                        Sleep (0x0A)
                        Store (0x00, GLEP) /* \_SB_.PCI0.GLEP */
                    }

                    Method (LPON, 0, NotSerialized)
                    {
                        Store (CondRefOf (\_GPE._L1C, Local0), Local1)
                        Return (Local1)
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    OperationRegion (PCIR, PCI_Config, 0x0C, 0x01)
                    Field (PCIR, AnyAcc, NoLock, Preserve)
                    {
                        CLSZ,   8
                    }
                }
            }

            Scope (\_GPE)
            {
                Name (CBID, 0x00)
                Method (L1C, 0, NotSerialized)
                {
                    Sleep (0x64)
                    If (LEqual (CBID, 0x01))
                    {
                        HNLP (0x1000)
                        Store (GIV, Local0)
                        XOr (Local0, 0x1000, GIV) /* \GIV_ */
                        Store (0x00, CBID) /* \_GPE.CBID */
                    }
                    Else
                    {
                        Increment (CBID)
                    }
                }

                Method (HNLP, 1, Serialized)
                {
                    If (\_SB.PCI0.RP06.NIC.LPON ())
                    {
                        If (NNST ())
                        {
                            INIC ()
                        }
                        Else
                        {
                            If (\_SB.PCI0.GLEP)
                            {
                                If (ILUX)
                                {
                                    Notify (\_SB.PCI0.RP06.NIC, 0x03) // Eject Request
                                }
                                Else
                                {
                                    \_SB.PCI0.RP06.NIC.EJ0 ()
                                }
                            }
                        }

                        Sleep (0x64)
                        Notify (\_SB.PCI0.RP06, 0x00) // Bus Check
                    }
                }

                Method (NNST, 0, Serialized)
                {
                    Store (GPL0, Local1)
                    Store (0x01, Local3)
                    If (And (Local1, 0x2000))
                    {
                        If (LEqual (\_SB.PCI0.LPCB.EC0.GACS (), 0x00))
                        {
                            If (And (Local1, 0x1000))
                            {
                                Store (0x00, Local3)
                            }
                        }
                    }

                    Return (Local3)
                }

                Method (INIC, 0, Serialized)
                {
                    OperationRegion (NPC2, SystemMemory, \_SB.PCI0.RP06.GADD (), 0x02)
                    Field (NPC2, AnyAcc, NoLock, Preserve)
                    {
                        VEID,   16
                    }

                    Store (0x0B, Local1)
                    Store (0x01, Local3)
                    If (\_SB.PCI0.GLEP)
                    {
                        If (LEqual (VEID, 0x11AB))
                        {
                            Store (0x00, Local1)
                            Store (0x00, Local3)
                        }
                    }

                    Store (\_SB.PCI0.RP06.HPCE, Local2)
                    While (LAnd (LGreater (Local1, 0x00), NNST ()))
                    {
                        Store (0x01, \_SB.PCI0.GLEP)
                        Sleep (0x012C)
                        Store (VEID, Local0)
                        If (LOr (LEqual (Local0, 0x11AB), LEqual (Local1, 0x01)))
                        {
                            Store (0x00, Local1)
                        }
                        Else
                        {
                            Store (0x00, \_SB.PCI0.GLEP)
                            Sleep (0xC8)
                            Decrement (Local1)
                        }
                    }

                    Store (Local2, \_SB.PCI0.RP06.HPCE)
                    If (Local3)
                    {
                        \_SB.SSMI (0xEA3E, 0x00, 0x00, 0x00, 0x00)
                    }

                    If (LEqual (\WCOS (), 0x03))
                    {
                        Store (0x10, \_SB.PCI0.RP06.NIC.CLSZ)
                    }
                }
            }
            Device (IMEI)
            {
                Name (_ADR, 0x00160000)
            }
            Device (MCHC)
            {
                Name (_ADR, Zero)
            }
        }

        	Name (NBTI, Package(0x02)
	{
		Package(0x0F)

            {
                0x01, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x01, 
                0xFFFFFFFF, 
                0x00, 
                0x00, 
                0x64, 
                0x64, 
                "Primary", 
                "100000", 
                "LIon", 
                		"Hewlett-Packard",
        Zero,
        Zero,
   	},
	Package(0x0F)

            {
                0x01, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x01, 
                0xFFFFFFFF, 
                0x00, 
                0x00, 
                0x64, 
                0x64, 
                "Travel", 
                "100000", 
                	"LIon",
	"Hewlett-Packard",
	Zero,
	Zero,
}
        })
        Name (NBST, Package (0x02)
        {
            Package (0x04)
            {
                0x00, 
                0x00, 
                0x0FA0, 
                0x04B0
            }, 

            Package (0x04)
            {
                0x00, 
                0x00, 
                0x0FA0, 
                0x04B0
            }
        })
        Name (NDBS, Package (0x04)
        {
            0x00, 
            0x00, 
            0x0FA0, 
            0x04B0
        })
        Name (ACST, 0x01)
        Name (SMAR, 0x00)
        Name (BT0P, 0x0F)
        Method (BTIF, 1, Serialized)
        {
            Store (\_SB.PCI0.LPCB.EC0.BTIF (Arg0), Local0)
            If (LEqual (Local0, 0xFF))
            {
                Return (Package (0x0D)
                {
                    0x00, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0x01, 
                    0xFFFFFFFF, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    "", 
                    "", 
                    "", 
                    0x00
                })
            }
            Else
            {
                Return (DerefOf (Index (NBTI, Arg0)))
            }
        }

        Name (NFBS, 0x01)
        Method (BTST, 1, Serialized)
        {
            Store (NFBS, Local1)
            If (NFBS)
            {
                Store (0x00, NFBS) /* \_SB_.NFBS */
            }

            Store (\_SB.PCI0.LPCB.EC0.BTST (Arg0, Local1), Local0)
            Return (DerefOf (Index (NBST, Arg0)))
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Store (\_SB.PCI0.LPCB.EC0.BSTA (0x01), Local0)
                If (XOr (BT0P, Local0))
                {
                    Store (Local0, BT0P) /* \_SB_.BT0P */
                    Store (Local0, Local1)
                    If (LNotEqual (Local1, 0x1F))
                    {
                        Store (0x00, Local1)
                    }

                    \_SB.SSMI (0xEA3A, 0x00, Local1, 0x00, 0x00)
                    Store (ECX, Local1)
                    \_GPE.HWWP (0x01)
                    \_SB.PCI0.LPCB.EC0.HWWP (Local1)

                }

                Return (Local0)
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (BTIF (0x00))
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Return (BTST (0x00))
            }

            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                
                Return (Zero)

            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (BTIF (0x01))
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Return (BTST (0x01))
            }

            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
        }

        Device (ADP1)
        {
            Name (_HID, "ACPI0003")  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Store (\_SB.PCI0.LPCB.EC0.GACS (), Local0)
                Store (Local0, PWRS) /* \PWRS */
                Store (\_SB.PCI0.LPCB.EC0.GPID (), Local1)
                If (XOr (Local0, ACST))
                {
                    \_GPE.HNLP (0x00)
                    \_SB.PCI0.ACEL.AJAL ()
                    \_GPE.VPUP (Local0, Local1)
                    \_SB.PCI0.LPCB.EC0.SMCP (Local0)
                }

                If (LOr (LAnd (Local0, LNot (ACST)), LAnd (Local1, LNot (SMAR))))
                {

                }

                Store (Local0, ACST) /* \_SB_.ACST */
                Store (Local1, SMAR) /* \_SB_.SMAR */
                Return (Local0)
            }
            Name (_PRW, Package() { 0x18, 0x03 })
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))  // _HID: Hardware ID
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Store (\_SB.PCI0.LPCB.EC0.CLID, Local0)
                Return (Local0)
            }
        }

        Device (HST1)
        {
            Name (_HID, EisaId ("PNP0C32"))  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Name (HS1S, 0xFF)
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If (LEqual (HS1S, 0xFF))
                {
                    Store (0x00, Local0)
                    If (LGreaterEqual (\WCOS (), 0x06))
                    {
                        If (ISUD ())
                        {
                            Store (0x0F, Local0)
                        }
                    }

                    Store (Local0, HS1S) /* \_SB_.HST1.HS1S */
                }

                Return (HS1S) /* \_SB_.HST1.HS1S */
            }

            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x0A, 
                0x05
            })
            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                \_SB.PCI0.LPCB.EC0.HSPW (Arg0, 0x01)
            }

            Method (GHID, 0, Serialized)
            {
                If (_STA ())
                {
                    If (\_SB.PCI0.LPCB.EC0.CHSW (0x01))
                    {
                        Notify (\_SB.HST1, 0x02) // Device Wake
                    }
                }

                Return (Buffer (0x01)
                {
                     0x01
                })
            }
        }

        
        

        OperationRegion (LDPT, SystemIO, 0x80, 0x01)
        Field (LDPT, ByteAcc, NoLock, Preserve)
        {
            LPDG,   8
        }

        OperationRegion (LDBP, SystemIO, 0x024C, 0x04)
        Field (LDBP, ByteAcc, NoLock, Preserve)
        {
            SLD1,   8, 
            SLD2,   8, 
            LLPD,   8, 
            LUPD,   8
        }

        Mutex (LDPS, 0x00)
        Mutex (LEXD, 0x00)
        Name (EDDA, 0x00)
        Method (ODBG, 1, NotSerialized)
        {
            Acquire (LDPS, 0xFFFF)
            Store (Arg0, LLPD) /* \_SB_.LLPD */
            Store (Arg0, LPDG) /* \_SB_.LPDG */
            Release (LDPS)
            Return (0x00)
        }

        Method (ODG1, 1, NotSerialized)
        {
            Acquire (LDPS, 0xFFFF)
            Store (Arg0, LUPD) /* \_SB_.LUPD */
            Release (LDPS)
            Return (0x00)
        }

        Method (ODGW, 1, NotSerialized)
        {
            Acquire (LDPS, 0xFFFF)
            Store (And (Arg0, 0xFF), LLPD) /* \_SB_.LLPD */
            Store (And (ShiftRight (Arg0, 0x08), 0xFF), LUPD) /* \_SB_.LUPD */
            Store (And (Arg0, 0xFF), LPDG) /* \_SB_.LPDG */
            Release (LDPS)
            Return (0x00)
        }

        Method (ODGD, 1, NotSerialized)
        {
            Return (0x00)
        }

        Method (OTBY, 1, NotSerialized)
        {
            Return (0x00)
        }

        Method (OTWD, 1, NotSerialized)
        {
            Return (0x00)
        }

        Method (OTDD, 1, NotSerialized)
        {
            Return (0x00)
        }

        Method (ISDR, 0, NotSerialized)
        {
            Return (0x00)
        }

        Method (EODB, 0, Serialized)
        {
            Acquire (LEXD, 0xFFFF)
            ODBG (EDDA)
            Release (LEXD)
        }

        Method (EODW, 0, Serialized)
        {
            Acquire (LEXD, 0xFFFF)
            ODGW (EDDA)
            Release (LEXD)
        }

        Method (EODD, 0, Serialized)
        {
            Acquire (LEXD, 0xFFFF)
            ODGD (EDDA)
            Release (LEXD)
        }
    }

    Method (\_SB.DCKD, 0, Serialized)
    {
        Store (0x01, Local0)
        If (And (GPL0, 0x2000))
        {
            Store (0x00, Local0)
        }

        Return (Local0)
    }

    Method (\_SB.HST1.ISUD, 0, Serialized)
    {
        Return (0x00)
    }

    Method (\_GPE.DKET, 0, Serialized)
    {
        If (LEqual (ICPT, 0x00))
        {
            If (\_SB.DCKD ())
            {
                Notify (\_SB.PCI0.LPCB.SIO.COM1, 0x00) // Bus Check
            }
            Else
            {
                Notify (\_SB.PCI0.LPCB.SIO.COM1, 0x01) // Device Check
            }
        }
    }

    Method (\_SB.PCI0.ACEL.ALED, 1, Serialized)
    {
        If (Arg0)
        {
            Or (GPL2, 0x02, GPL2) /* \GPL2 */
        }
        Else
        {
            And (GPL2, Not (0x02), GPL2) /* \GPL2 */
        }
    }

    Method (\_SB.GRFS, 0, Serialized)
    {
        Store (\_SB.PCI0.LPCB.EC0.KRFS (), Local0)
        Return (Local0)
    }

    Method (\_SB.HODM, 3, NotSerialized)
    {
        Return (Package (0x02)
        {
            0x03, 
            0x00
        })
    }

    Method (PPTS, 1, Serialized)
    {
        \_SB.SSMI (0x5D, 0x03, 0x00, 0x00, 0x00)
        Store (0x00, Local0)
    }

    Method (PWAK, 1, Serialized)
    {
        Notify (\_SB.PCI0.LPCB.SIO.COM1, 0x00) // Bus Check
        Notify (\_SB.PCI0.RP02, 0x00) // Bus Check
        Notify (\_SB.PCI0.EH01, 0x00) // Bus Check
        Notify (\_SB.PCI0.EH02, 0x00) // Bus Check
        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            \_SB.SSMI (0x5D, 0x01, 0x00, 0x00, 0x00)
            Notify (\_SB.PCI0.RP03, 0x00) // Bus Check
        }

        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            \_SB.PCI0.XHC.XWAK ()
        }

        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            If (LEqual (\WCOS (), 0x06))
            {
                If (\_SB.PCI0.RP06.NIC.LPON ())
                {
                    If (\_SB.DCKD ())
                    {
                        Notify (\_SB.PCI0.RP06.NIC, 0x00) // Bus Check
                    }
                }
            }
        }
    }

    Method (\_SB.PCI0.LPCB.PS2M._HID, 0, Serialized)  // _HID: Hardware ID
    {
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
        While (One)
        {
            Store (PRDT, _T_0) /* \_SB_.PCI0.LPCB.PS2M._HID._T_0 */
            If (LEqual (_T_0, 0x01))
            {
                Store (0x8F012E4F, Local1)
            }
            Else
            {
                If (LEqual (_T_0, 0x02))
                {
                    Store (0x8E012E4F, Local1)
                }
                Else
                {
                    If (LEqual (_T_0, 0x03))
                    {
                        Store (0x91012E4F, Local1)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x04))
                        {
                            Store (0x8D012E4F, Local1)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x05))
                            {
                                Store (0x9B012E4F, Local1)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x06))
                                {
                                    Store (0x98012E4F, Local1)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x07))
                                    {
                                        Store (0x80012E4F, Local1)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x0C))
                                        {
                                            Store (0x92012E4F, Local1)
                                        }
                                        Else
                                        {
                                            Store (0x98012E4F, Local1)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Break
        }

        Return (Local1)
    }

    Name (_S0, Package (0x03)  // _S0_: S0 System State
    {
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x03)  // _S3_: S3 System State
    {
        0x05, 
        0x05, 
        0x00
    })
    Name (_S4, Package (0x03)  // _S4_: S4 System State
    {
        0x06, 
        0x06, 
        0x00
    })
    Name (_S5, Package (0x03)  // _S5_: S5 System State
    {
        0x07, 
        0x07, 
        0x00
    })
    Method (B1B2, 2, NotSerialized)
    {
        ShiftLeft (Arg1, 8, Local0)
        Or (Arg0, Local0, Local0)
        Return (Local0)
    }
    Device (SMCD)
    {
        Name (_HID, "FAN00000") // _HID: Hardware ID
        // ACPISensors.kext configuration
        Name (TACH, Package()
        {
            "System Fan", "FAN0",
        })
        Name (TEMP, Package()
        {
            "CPU Heatsink", "TCPU",
            "Ambient", "TAMB",
            //"Mainboard", "TSYS",
            //"CPU Proximity", "TCPP",
        })
        // Actual methods to implement fan/temp readings/control
        Method (FAN0, 0, Serialized)
        {
            Store (\_SB.PCI0.LPCB.EC0.FRDC, Local0)
            If (Local0) { Divide (Add(0x3C000, ShiftRight(Local0,1)), Local0,, Local0) }
            If (LEqual (0x03C4, Local0)) { Return (Zero) }
            Return (Local0)
        }
        Method (TCPU, 0, Serialized)
        {
            Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
            Store (1, \_SB.PCI0.LPCB.EC0.CRZN)
            Store (\_SB.PCI0.LPCB.EC0.DTMP, Local0)
            Release (\_SB.PCI0.LPCB.EC0.ECMX)
            Return (Local0)
        }
        Method (TAMB, 0, Serialized)
        {
            Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
            Store (4, \_SB.PCI0.LPCB.EC0.CRZN)
            Store (\_SB.PCI0.LPCB.EC0.TEMP, Local0)
            Release (\_SB.PCI0.LPCB.EC0.ECMX)
            Return (Local0)
        }
        // Fan Control Table (pairs of temp, fan control byte)
        Name (FTAB, Buffer()
        {
            35, 255,  // This FTAB list modified by Don_Grappler
            42, 128,
            43, 127,
            44, 126,
            45, 125,
            46, 124,
            47, 123,
            48, 122,
            49, 121,
            50, 120,
            51, 119,
            52, 118,
            53, 117,
            54, 116,
            55, 115,
            56, 113,
            57, 111,
            58, 109,
            59, 107,
            60, 105,
            61, 102,
            62, 99,
            63, 96,
            64, 93,
            65, 90,
            66, 86,
            67, 82,
            68, 78,
            69, 74,
            70, 70,
            71, 65,
            72, 60,
            73, 55,
            0xFF, 0
        })
        // Table to keep track of past temperatures (to track average)
        Name (FHST, Buffer(16) { 0x0, 0, 0, 0, 0x0, 0, 0, 0, 0x0, 0, 0, 0, 0x0, 0, 0, 0 })
        Name (FIDX, Zero) // current index in buffer above
        Name (FNUM, Zero) // number of entries in above buffer to count in avg
        Name (FSUM, Zero) // current sum of entries in buffer
        // Keeps track of last fan speed set, and counter to set new one
        Name (FLST, 0xFF) // last index for fan control
        Name (FCNT, 0) // count of times it has been "wrong", 0 means no counter
        Name (FCTU, 2) // timeout for changes (fan rpm going up)   --   modified by Don_Grappler
        Name (FCTD, 5) // timeout for changes (fan rpm going down)   --   modified by Don_Grappler
        // Fan control for CPU -- expects to be evaluated 1-per second
        Method (FCPU, 0, Serialized)
        {
            Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
            // setup fake temperature (this is the key to controlling the fan!)
            Store (1, \_SB.PCI0.LPCB.EC0.CRZN)  // select CPU temp
            Store (31, \_SB.PCI0.LPCB.EC0.TEMP) // write fake value there (31C)
            // get current temp into Local0 for eventual return
            // Note: reading from DTMP here instead of TEMP because we wrote
            //  a fake temp to TEMP to trick the system into running the fan
            //	at a lower speed than it otherwise would.
            Store (1, \_SB.PCI0.LPCB.EC0.CRZN)  // select CPU temp
            Store (\_SB.PCI0.LPCB.EC0.DTMP, Local0) // Local0 is current temp
            // calculate average temperature
            Add (Local0, FSUM, Local1)
            Store (FIDX, Local2)
            Subtract (Local1, DerefOf (Index (FHST, Local2)), Local1)
            Store (Local0, Index (FHST, Local2))
            Store (Local1, FSUM)  // Local1 is new sum
            // adjust current index into temp table
            Increment (Local2)
            if (LGreaterEqual (Local2, SizeOf(FHST))) { Store (0, Local2) }
            Store (Local2, FIDX)
            // adjust total items collected in temp table
            Store (FNUM, Local2)
            if (LNotEqual (Local2, SizeOf (FHST)))
            {
                Increment (Local2)
                Store (Local2, FNUM)
            }
            // Local1 is new sum, Local2 is number of entries in sum
            Divide (Local1, Local2,, Local0)  // Local0 is now average temp
            // table based search (use avg temperature to search)
            if (LGreater (Local0, 255)) { Store (255, Local0) }
            Store (Zero, Local2)
            while (LGreater (Local0, DerefOf (Index (FTAB, Local2)))) { Add (Local2, 2, Local2) }
            // calculate difference between current and found index
            if (LGreater (Local2, FLST))
            {
                Subtract(Local2, FLST, Local1)
                Store(FCTU, Local4)
            }
            Else
            {
                Subtract(FLST, Local2, Local1)
                Store(FCTD, Local4)
            }
            // set new fan speed, if necessary
            if (LEqual (Local1, 0))
            {
                // no difference, so leave current fan speed and reset count
                Store (0, FCNT)
            }
            Else
            {
                // there is a difference, start/continue process of changing fan
                Store (FCNT, Local3)
                Increment (Local3)
                Store (Local3, FCNT)
                // how long to wait depends on how big the difference
                // 20 secs if diff is 2, 5 secs if diff is 4, etc.
                Divide (ShiftLeft (Local4, 1), Local1,, Local1)
                if (LGreaterEqual (Local3, Local1))
                {
                    // timeout expired, so set new fan speed
                    Store (Local2, FLST)
                    Increment (Local2)
                    Store (DerefOf (Index (FTAB, Local2)), \_SB.PCI0.LPCB.EC0.FTGC)
                    Store (0, FCNT)
                }
            }
            Release (\_SB.PCI0.LPCB.EC0.ECMX)
            return (Local0)  // returns average temp
        }
    }
}

