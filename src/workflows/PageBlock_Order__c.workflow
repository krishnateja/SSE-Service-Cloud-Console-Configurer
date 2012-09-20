<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_PageBlockName</fullName>
        <field>Name</field>
        <formula>IF( Name ==&apos;Activity History&apos;  || Name ==&apos;Open Activities&apos; , &apos;Task&apos;, Name)</formula>
        <name>Update PageBlockName</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update PageBlock Order</fullName>
        <actions>
            <name>Update_PageBlockName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>PageBlock_Order__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
